from django.http import HttpRequest
from django.shortcuts import render
from django.db import connection
from crm.models import Salesorder, Orderdetail, Customer
import decimal

# Create your views here.
def customer_infomation(request: HttpRequest, custid: int):
    # cus infomation
    cus = Customer.objects.get(custid=custid)

    # LOAD SALE ORDER
    # sale order and order detail
    order_cols = [a.name for a in Salesorder._meta.fields]
    order_cols.remove('custid')
    order_cols.remove('shipregion')
    order_cols.remove('shipperid')
    order_cols.remove('shippostalcode')
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
            # ship order
            'ship_order': ship_order,
            # discount order
            'discount_order': discount_order,
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