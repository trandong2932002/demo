from django.db import connection
from django.shortcuts import render
from django.http import HttpRequest, JsonResponse

from datetime import date

from .forms import CATEGORY_CHOICES, ShippedDate, OrderDiscount, Revenue


BACKGROUND_COLOR = ['rgba(237, 136, 82, 0.2)',
                    'rgba(242, 205, 117, 0.2)',
                    'rgba(186, 224, 135, 0.2)',
                    'rgba(109, 203, 147, 0.2)',
                    'rgba(71, 137, 122, 0.2)',
                    'rgba(73, 117, 143, 0.2)',
                    'rgba(202, 112, 21, 0.2)',
                    'rgba(165, 74, 187, 0.2)',
                    # default
                    'rgba(237, 136, 82, 0.2)',]
BORDER_COLOR = ['rgba(237, 136, 82, 1)',
                'rgba(242, 205, 117, 1)',
                'rgba(186, 224, 135, 1)',
                'rgba(109, 203, 147, 1)',
                'rgba(71, 137, 122, 1)',
                'rgba(73, 117, 143, 1)',
                'rgba(202, 112, 21, 1)',
                'rgba(165, 74, 187, 1)',
                # default
                'rgba(237, 136, 82, 1)',]


# VIEWS
def main_page(request: HttpRequest):

    now = str(date.today())
    # data
    shipped_date = GetShippedDate('2000-01-01', now)
    shipped_date = [y for x in shipped_date for y in x.values()]

    order_discount = GetOrderDiscount('2000-01-01', now)

    revenue_month = GetRevenue('2000-01-01', now)

    # form
    shipped_date_form = ShippedDate()
    order_discount_form = OrderDiscount()
    revenue_form = Revenue()

    data = {
        # form
        'shipped_date_form': shipped_date_form,
        'order_discount_form': order_discount_form,
        'revenue_form': revenue_form,
        # data
        'shipped_date': shipped_date,
        'order_discount': order_discount,
        'revenue_month': revenue_month,
    }

    return render(request, 'main_page/main_page.html', data)


# AJAX 
def ChangeShippedDate(request: HttpRequest):
    if is_ajax(request=request) and request.method == 'POST':
        shipped_date_form = ShippedDate(data=request.POST)
        if shipped_date_form.is_valid():
            shipped_date_form.cleaned_data
            start_at = shipped_date_form.data['shipped_date_start_at']
            end_at = shipped_date_form.data['shipped_date_end_at']

            shipped_date = GetShippedDate(start_at, end_at)
            shipped_date = [y for x in shipped_date for y in x.values()]

            data = {
                'success': 'success',
                'shipped_date': shipped_date,
            }

            return JsonResponse(data, status=200)
        else:
            return JsonResponse({'error': 'error'}, status=400)


def ChangeOrderDiscount(request: HttpRequest):
    if is_ajax(request=request) and request.method == 'POST':
        order_discount_form = OrderDiscount(data=request.POST)
        if order_discount_form.is_valid():
            order_discount_form.cleaned_data
            start_at = order_discount_form.data['order_discount_start_at']
            end_at = order_discount_form.data['order_discount_end_at']

            order_discount = GetOrderDiscount(start_at, end_at)

            data = {
                'success': 'success',
                'order_discount': order_discount,
            }

            return JsonResponse(data, status=200)
        else:
            return JsonResponse({'error': 'error'}, status=400)


def ChangeRevenue(request: HttpRequest):
    if is_ajax(request=request) and request.method == 'POST':
        revenue_form = Revenue(data=request.POST)
        if revenue_form.is_valid():
            revenue_form.cleaned_data
            category = revenue_form.data['category']
            start_at = revenue_form.data['revenue_start_at']
            end_at = revenue_form.data['revenue_end_at']

            revenue = GetRevenue(start_at, end_at, category)

            revenue_labels = []
            revenue_datasets = []
            categoryid = int(category)
            if categoryid != 10:
                dataset = {}
                data = []
                for i in range(len(revenue)):
                    revenue_labels.append(revenue[i]['orderdate'])
                    data.append(revenue[i]['amount'])
                dataset['data'] = data
                dataset['backgroundColor'] = [BACKGROUND_COLOR[categoryid-1]]
                dataset['borderColor'] = [BORDER_COLOR[categoryid-1]]
                dataset['borderWidth'] = 1
                dataset['label'] = CATEGORY_CHOICES[categoryid-1][1]
                revenue_datasets.append(dataset)
            else:
                # get labels
                temp = revenue[0]['categoryid']
                for item in revenue:
                    if item['categoryid'] != temp:
                        break
                    revenue_labels.append(item['orderdate'])
                # get each dataset
                temp = revenue[0]['categoryid']
                data = []
                dataset = {}
                for item in revenue:
                    if item['categoryid'] != temp:
                        dataset['data'] = data
                        dataset['backgroundColor'] = [BACKGROUND_COLOR[temp-1]]
                        dataset['borderColor'] = [BORDER_COLOR[temp-1]]
                        dataset['borderWidth'] = 1
                        dataset['label'] = CATEGORY_CHOICES[temp-1][1]
                        revenue_datasets.append(dataset)
                        # reset
                        temp = item['categoryid']
                        dataset = {}
                        data = []
                    data.append(item['amount'])
                # last dataset
                temp = item['categoryid']
                dataset['data'] = data
                dataset['backgroundColor'] = [BACKGROUND_COLOR[temp-1]]
                dataset['borderColor'] = [BORDER_COLOR[temp-1]]
                dataset['borderWidth'] = 1
                dataset['label'] = CATEGORY_CHOICES[temp-1][1]
                revenue_datasets.append(dataset)

            data = {
                'success': 'success',
                'type': category,
                'revenue_labels': revenue_labels,
                'revenue_datasets': revenue_datasets,
            }

            return JsonResponse(data, status=200)
        else:
            return JsonResponse({'error': 'error'}, status=400)


# GET DATA
def GetShippedDate(start_at, end_at):
    query = f"""
    select count1, count2 from
    (select count(*) as count1 from salesorder
    where requireddate >= shippeddate
    and orderdate >= '{start_at}' and orderdate <= '{end_at}'
    and shippeddate >= orderdate) A,
    (select count(*) as count2 from salesorder
    where requireddate < shippeddate
    and orderdate >= '{start_at}' and orderdate <= '{end_at}'
    and shippeddate >= orderdate) B
    """
    with connection.cursor() as cursor:
        cursor.execute(query)
        result = dictfetchall(cursor)
    return result


def GetOrderDiscount(start_at, end_at):
    query = f"""
    select discount, sum(qty) as count from orderdetail inner join
    (select orderid from salesorder where orderdate >= '{start_at}' and orderdate <= '{end_at}'
    and shippeddate >= orderdate) A
    on orderdetail.orderid = A.orderid
    group by discount
    order by discount
    """
    with connection.cursor() as cursor:
        cursor.execute(query)
        result = dictfetchall(cursor)
    return result


def GetRevenue(start_at, end_at, category = '9'):
    # parse category
    category = int(category) 
    category_name = ''
    for x in CATEGORY_CHOICES:
        if category == x[0]:
            category_name = x[1]
            break

    # query string
    query_category = ""
    if category_name == CATEGORY_CHOICES[8][1]: # All
        query_category = ""
    elif category_name != CATEGORY_CHOICES[9][1]: # != Combine
        query_category = f"""
        where categoryid in (select categoryid from category where categoryname = '{category_name}')
        """
    query = f"""
    select orderdate, round(sum(unitprice*qty*(1-discount)),2) as amount from
    (select B.productid, B.unitprice, qty, discount, categoryid, orderdate from product inner join
    (select productid, unitprice, qty, discount, orderdate from orderdetail inner join
    (select orderid, date_trunc('month', orderdate) as orderdate from salesorder
    where orderdate <= '{end_at}' and orderdate >= '{start_at}'
    and shippeddate >= orderdate) A
    on orderdetail.orderid = A.orderid) B
    on product.productid = B.productid
    {query_category}
    ) C
    group by orderdate
    order by orderdate
    """

    # Combine
    if category_name == CATEGORY_CHOICES[9][1]:
        query = f"""
        select D.orderdate, D.categoryid, coalesce(amount,0) as amount from
        (select categoryid, orderdate_new as orderdate from category,
        (select date_trunc('month',orderdate) as orderdate_new 
        from salesorder
        where orderdate <= '{end_at}' and orderdate >= '{start_at}'
        and shippeddate >= orderdate
        group by orderdate_new) C) D
        full join
        (select orderdate, categoryid, sum(amount) as amount from product inner join
        (select productid, round(unitprice*qty*(1-discount),2) as amount, orderdate from orderdetail inner join
        (select orderid, date_trunc('month', orderdate) as orderdate
        from salesorder
        where orderdate <= '{end_at}' and orderdate >= '{start_at}'
        and shippeddate >= orderdate
        ) A
        on orderdetail.orderid = A.orderid) B
        on product.productid = B.productid
        group by orderdate, categoryid) E
        on D.orderdate = E.orderdate and D.categoryid = E.categoryid
        order by categoryid, orderdate
        """
    
    # Dataset = background color, bordercolor, data, label
    # query
    with connection.cursor() as cursor:
        cursor.execute(query)
        result = dictfetchall(cursor)
    return result


# ADDITION FUNC
def dictfetchall(cursor): 
    "Returns all rows from a cursor as a dict"
    desc = cursor.description 
    return [
            dict(zip([col[0] for col in desc], row)) 
            for row in cursor.fetchall() 
    ]

def is_ajax(request):
    return request.META.get('HTTP_X_REQUESTED_WITH') == 'XMLHttpRequest'
