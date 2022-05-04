from django.http import HttpRequest
from django.shortcuts import render
from crm.models import Salesorder, Orderdetail, Customer
import decimal

# Create your views here.
def customer_infomation(request: HttpRequest, custid: int):
    # sales order
    cus = Customer.objects.get(custid=custid)
    order_cols = [a.name for a in Salesorder._meta.fields]
    order_detail_cols = [a.name for a in Orderdetail._meta.fields]
    order_list = Salesorder.objects.filter(custid=custid)
    order_count = order_list.count()
    total_amount = decimal.Decimal(0)

    order_detail_list = []

    for i in order_list:
        order_detail = Orderdetail.objects.filter(orderid=i.orderid)
        total_amount += amount_calc(order_detail)

        order_detail_list.append(get_order_detail(i.orderid))

    data = {'order_cols': order_cols,
            'order_detail_cols': order_detail_cols,
            'order_list': order_list,
            'total_amount': total_amount,
            'order_count': order_count,
            'cus': cus,}
    data = data | {'order_detail_list': order_detail_list}
    return render(request, 'cus_info/cus_info.html',
                  data)



def get_order_detail(orderid: int):
    # order detail
    order_detail = Orderdetail.objects.filter(orderid=orderid)
    amount = amount_calc(order_detail)
    return {'orderid': orderid,
            'order_detail': order_detail,
            'amount': amount,}

def amount_calc(order_detail):
    amount = decimal.Decimal(0)
    for order in order_detail:
        amount += order.unitprice * order.qty * (1-order.discount)
    return amount