from django.http import HttpRequest
from django.shortcuts import redirect, render
from django.db import connection
from crm.models import Orderdetail, Salesorder, Customer, Category
import decimal
from datetime import datetime
from .forms import AddOrderDetailForm, DeleteOrderDetailForm

# Create your views here.
def customer_infomation(request: HttpRequest, custid: int):
    # cus infomation
    cus = Customer.objects.get(custid=custid)

    # LOAD SALE ORDER
    # sale order and order detail
    order_cols = [a.name for a in Salesorder._meta.fields]
    # order_cols.remove('custid')
    # order_cols.remove('shipregion')
    # order_cols.remove('shipperid')
    # order_cols.remove('shippostalcode')
    # I use raw quaery to get order_detail, so this cols must be
    order_detail_cols = ['productid', 'productname', 'unitprice', 'qty', 'discount', 'amount']
    # get all sale order
    order_list = Salesorder.objects.filter(custid=custid)
    # calc count, amount of all order of 1 cus
    order_count = order_list.count()
    total_amount = decimal.Decimal(0)

    # all order list = list of ( dict(orderid, order_detail, amount) of each order )
    order_detail_list = []

    for order in order_list:
        # get all order detail from orderid
        order_detail = None
        # open connection
        with connection.cursor() as cursor:
            query = f"""
            select B.productid, productname, B.unitprice, qty, discount, amount from product
            inner join (select orderdetail.orderid, productid, unitprice, qty, discount, round((unitprice*qty)*(1-discount),2) as amount from orderdetail 
            where orderid = {order.orderid}) B
            on product.productid = B.productid
            """
            cursor.execute(query)
            # convert query result to list of dict, each dict represent for one product, a list represent for order
            order_detail = dictfetchall(cursor)
        # close connection

        # create order_detail_list
        order_info = dict()
        order_info['orderid'] = order.orderid
        order_info['order_detail'] = order_detail
        # calc amount
        amount = decimal.Decimal(0)
        for order_product in order_detail:
            amount += order_product['amount']
        order_info['amount'] = amount
        # add order_info into order_detail_list
        order_detail_list.append(order_info)
        
        # calc total amount
        total_amount += amount

    # LOAD SALE ORDER CATEGORY, COUNT
    temp = None
    with connection.cursor() as cursor:
        query = f"""
        select categoryname, coalesce(quantity,0) as quantity, description from category left join
        (select categoryid, sum(qty) as quantity from product inner join
        (select productid, qty from orderdetail inner join 
        (select orderid from salesorder where custid='{cus.custid}') A 
        on orderdetail.orderid = A.orderid) B
        on product.productid = B.productid
        group by categoryid) C
        on category.categoryid = C.categoryid
        """
        cursor.execute(query)
        temp = dictfetchall(cursor)
    # list of category name
    category_name = []
    # list of category quantity (by product)
    category_quantity = []
    # list of category description
    category_description = []
    if any(x['quantity'] != 0 for x in temp):
        for item in temp:
            category_name.append(item['categoryname'])
            category_quantity.append(item['quantity'])
            category_description.append(item['description'])

    # LOAD SHIPPED DATE STATUS: LATE OR ON TIME
    # get late
    ship_order = []
    with connection.cursor() as cursor:
        query = f"""
        select count1, count2 from
        (select count(*) as count1 from salesorder where requireddate >= shippeddate and custid='{cus.custid}') A,
        (select count(*) as count2 from salesorder where requireddate < shippeddate and custid='{cus.custid}') B
        """
        cursor.execute(query)
        a, b = cursor.fetchone()
        if a != 0 or b != 0:
            ship_order.append(a)
            ship_order.append(b)
    
    # LOAD DISCOUNT ORDERS
    discount_order = None
    with connection.cursor() as cursor:
        query = f"""
        select discount, sum(qty) as count from orderdetail inner join
        (select orderid from salesorder where custid='{cus.custid}') A
        on orderdetail.orderid = A.orderid
        group by discount
        order by discount
        """
        cursor.execute(query)
        discount_order = dictfetchall(cursor)

    # LOAD PRODUCT QUANTITY BY MONTH
    with connection.cursor() as cursor:
        query = f"""
        select categoryname, orderdate, sum(qty) as qty from category inner join
        (select categoryid, qty, date_trunc('month', orderdate) as orderdate from product inner join
        (select productid, qty, orderdate from orderdetail inner join
        (select orderid, orderdate from salesorder where custid='{cus.custid}') A
        on orderdetail.orderid = A.orderid) B
        on product.productid = B.productid) C
        on category.categoryid = C.categoryid
        group by categoryname, orderdate
        order by orderdate, categoryname
        """
        cursor.execute(query)
        temp = dictfetchall(cursor)
    categories = [x.categoryname for x in Category.objects.all().order_by('categoryname')]

    category_quantity_by_month = [] # list of multi layer datasets, each layer is 1 category
    for i in range(len(categories)):
        category_quantity_by_month.append([])
        
    layer_temp = [None]*len(categories)

    orderdate = None
    if len(temp) > 0:
        orderdate = [temp[0]['orderdate']]

        for item in temp:
            # new date
            if item['orderdate'] != orderdate[-1]:
                orderdate.append(item['orderdate'])
                # fill full of layer before add to resutl
                for i in range(len(categories)):
                    if layer_temp[i] is None:
                        layer_temp[i] = 0
                # add to result
                for i in range(len(categories)):
                    category_quantity_by_month[i].append(layer_temp[i])
                # print()
                # reset layer
                layer_temp = [None]*len(categories)
            index_of_item = categories.index(item['categoryname'])
            layer_temp[index_of_item] = item['qty']

        # add to result: last month
        for i in range(len(categories)):
            if layer_temp[i] is None:
                layer_temp[i] = 0
        for i in range(len(categories)):
            category_quantity_by_month[i].append(layer_temp[i])
        
        # convert orderdate to MM YYYY
        for i in range(len(orderdate)):
            orderdate[i] = orderdate[i].strftime("%B %Y")

    # background color
    background_color = ['rgba(237, 136, 82, 0.2)',
                        'rgba(242, 205, 117, 0.2)',
                        'rgba(186, 224, 135, 0.2)',
                        'rgba(109, 203, 147, 0.2)',
                        'rgba(71, 137, 122, 0.2)',
                        'rgba(73, 117, 143, 0.2)',
                        'rgba(202, 112, 21, 0.2)',
                        'rgba(165, 74, 187, 0.2)',]
    border_color = ['rgba(237, 136, 82, 1)',
                    'rgba(242, 205, 117, 1)',
                    'rgba(186, 224, 135, 1)',
                    'rgba(109, 203, 147, 1)',
                    'rgba(71, 137, 122, 1)',
                    'rgba(73, 117, 143, 1)',
                    'rgba(202, 112, 21, 1)',
                    'rgba(165, 74, 187, 1)',]
    # background color


    # FORM
    if request.method == 'POST':
        order_form_delete = None
        if 'delete' in request.POST:
            order_form_delete = DeleteOrderDetailForm(data=request.POST)
            if order_form_delete.is_valid():
                orderid = int(request.POST['delete_id'])
                if orderid != '':
                    order_del = Salesorder.objects.get(orderid=orderid)
                    order_del.delete()
                return redirect('/customerinformation/' + str(cus.custid))
        order_form = AddOrderDetailForm(data=request.POST)
        if 'add' in request.POST:
            if order_form.is_valid():
                order_form.cleaned_data
                order_form.save(commit=True)
                return redirect('/customerinformation/' + str(cus.custid))
        if 'edit' in request.POST:
            if order_form.is_valid():
                orderid = int(request.POST['orderid'])
                order_edit = Salesorder.objects.get(orderid=orderid)
                for key, value in order_form.cleaned_data.items():
                    setattr(order_edit, key, value)
                order_edit.save()
                return redirect('/customerinformation/' + str(cus.custid))
    else:
        order_form = AddOrderDetailForm()
        order_form_delete = DeleteOrderDetailForm()


    data = {
            # order
            'order_cols': order_cols,
            'order_list': order_list,
            # order other info
            'total_amount': total_amount,
            'order_count': order_count,
            # order detail
            'order_detail_cols': order_detail_cols,
            'order_detail_list': order_detail_list,
            # cus
            'cus': cus,
            # product category quantity
            'category_name': category_name,
            'category_quantity': category_quantity,
            'category_description': category_description,
            # product quantity by month
            'orderdate': orderdate,
            'category_quantity_by_month': category_quantity_by_month,
            # ship order
            'ship_order': ship_order,
            # discount order
            'discount_order': discount_order,
            # chart color
            'background_color': background_color,
            'border_color': border_color,
            # form
            'order_form': order_form,
            'order_form_delete': order_form_delete,
            }
    return render(request, 'cus_info/cus_info.html',
                  data)




def dictfetchall(cursor): 
    "Returns all rows from a cursor as a dict"
    desc = cursor.description 
    return [
            dict(zip([col[0] for col in desc], row)) 
            for row in cursor.fetchall() 
    ]