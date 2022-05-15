from datetime import date
from django.db import connection
from django.shortcuts import render
from django.http import HttpRequest
from crm.models import Customer
from .forms import ShippedDate, OrderDiscount


# Create your views here.
def main_page(request: HttpRequest):

    now = str(date.today())

    shipped_date = GetShippedDate('2000-01-01', now)
    shipped_date = [y for x in shipped_date for y in x.values()]

    order_discount = GetOrderDiscount('2000-01-01', now)

    shipped_date_form = ShippedDate()
    order_discount_form = OrderDiscount()

    if request.method == 'POST':
        if 'change_shipped_date' in request.POST:
            shipped_date_form = ShippedDate(data=request.POST)
            if shipped_date_form.is_valid():
                shipped_date_form.cleaned_data
                start_at = shipped_date_form.data['shipped_date_start_at']
                end_at = shipped_date_form.data['shipped_date_end_at']

                shipped_date = GetShippedDate(start_at, end_at)
                shipped_date = [y for x in shipped_date for y in x.values()]

        if 'change_order_discount' in request.POST:
            order_discount_form = OrderDiscount(data=request.POST)
            if order_discount_form.is_valid():
                order_discount_form.cleaned_data
                start_at = order_discount_form.data['order_discount_start_at']
                end_at = order_discount_form.data['order_discount_end_at']

                order_discount = GetOrderDiscount(start_at, end_at)
       


    
    data = {
        # form
        'shipped_date_form': shipped_date_form,
        'order_discount_form': order_discount_form,
        # data
        'shipped_date': shipped_date,
        'order_discount': order_discount,
    }

    return render(request, 'main_page/main_page.html', data)


def GetShippedDate(start_at, end_at):
    with connection.cursor() as cursor:
        query = f"""
        select count1, count2 from
        (select count(*) as count1 from salesorder where requireddate >= shippeddate and orderdate >= '{start_at}' and orderdate <= '{end_at}') A,
        (select count(*) as count2 from salesorder where requireddate < shippeddate and orderdate >= '{start_at}' and orderdate <= '{end_at}') B
        """
        cursor.execute(query)
        result = dictfetchall(cursor)
    return result


def GetOrderDiscount(start_at, end_at):
    with connection.cursor() as cursor:
        query = f"""
        select discount, sum(qty) as count from orderdetail inner join
        (select orderid from salesorder where orderdate >= '{start_at}' and orderdate <= '{end_at}') A
        on orderdetail.orderid = A.orderid
        group by discount
        order by discount
        """
        cursor.execute(query)
        result = dictfetchall(cursor)
    return result


def dictfetchall(cursor): 
    "Returns all rows from a cursor as a dict"
    desc = cursor.description 
    return [
            dict(zip([col[0] for col in desc], row)) 
            for row in cursor.fetchall() 
    ]