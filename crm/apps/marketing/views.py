from datetime import date
from django.db import connection
from django.http import HttpRequest, JsonResponse
from django.shortcuts import render
from .forms import CustomerFilter, SendEmail,\
     MARKETING_CATEGORY_CHOICES, CUSTOMER_COUNTRY_CHOICES
from crm.models import Customer

# VIEWS
def marketing(request):

    now = str(date.today())
    # form
    customer_filter_form = CustomerFilter()
    # data
    customer_filter = GetCustomerFilter('2000-01-01', now)
    customer_filter_cols = [key for key in customer_filter[0].keys()]

    data = {
        # form
        'customer_filter_form': customer_filter_form,
        # data
        'customer_filter_cols': customer_filter_cols,
        'customer_filter': customer_filter,
    }


    return render(request, 'marketing/marketing.html', data)


def send_email(request: HttpRequest, customer_string: str):
    customer_list = customer_string.split('_')
    status = None

    if request.method == 'POST':
        send_email_form = SendEmail(data=request.POST)
        if send_email_form.is_valid():
            send_email_form.cleaned_data
            subject = send_email_form.data['subject']
            body = send_email_form.data['body']
            to = send_email_form.data['to'].split(', ')
            to = [x for x in to]
            cc = send_email_form.data['cc']
            bcc = send_email_form.data['bcc']

            from django.core.mail import EmailMessage
            from django.conf import settings

            email = EmailMessage(
                subject=subject,
                body=body,
                from_email=settings.EMAIL_HOST_USER,
                to=to,
                cc=cc,
                bcc=bcc,
            )

            # email.send()
            status = 'success'
        else:
            status = 'error'
    else:
        temp = Customer.objects.filter(custid__in=customer_list).values_list('email')
        customer_email = ''
        for email in temp:
            customer_email += email[0] + ', '
        customer_email = customer_email[0:-2]
        send_email_form = SendEmail(initial={'to': customer_email})

    # data
    data = {
        'send_email_form': send_email_form,
        'status': status,
    }
    return render(request, 'marketing/send_email.html', data)

# AJAX
def ChangeCustomerFilter(request: HttpRequest):
    if is_ajax(request=request) and request.method == 'POST':
        customer_filter_form = CustomerFilter(data=request.POST)
        if customer_filter_form.is_valid():
            customer_filter_form.cleaned_data
            category = customer_filter_form.data['category']
            country = customer_filter_form.data['country']
            start_at = customer_filter_form.data['start_at']
            end_at = customer_filter_form.data['end_at']

            customer_filter = GetCustomerFilter(start_at, end_at, category, country)

            data = {
                'success': 'success',
                'category': category,
                'country': country,
                'customer_filter': customer_filter,
            }

            return JsonResponse(data, status=200)
        else:
            return JsonResponse({'error': 'error'}, status=400)

# GET DATA
def GetCustomerFilter(start_at, end_at, category = '9', country = '22'):
    query_category = ''
    query_customer_country = ''
    if category != '9': # all
        query_category = f"where categoryid={category}"
    if country != '22': # all
        country_name = next(x[1] for x in CUSTOMER_COUNTRY_CHOICES if x[0] == int(country))
        query_customer_country = f"where country='{country_name}'"
    query = f"""
    select custid, companyname, contactname, phone, fax, sum(qty) as qty, sum(amount) as amount from product inner join
    (select companyname, contactname, phone, fax, productid, round(unitprice*qty*(1-discount),2) as amount, qty, custid from orderdetail inner join
    (select A.custid, companyname, contactname, phone, fax, orderid from customer inner join
    (select cast(custid as integer) as custid, orderid from salesorder
    where orderdate <= shippeddate
    and orderdate >= '{start_at}' and orderdate <= '{end_at}') A
    on customer.custid = A.custid
    {query_customer_country}
    ) C
    on orderdetail.orderid = C.orderid) B
    on product.productid = B.productid
    {query_category}
    group by custid, companyname, contactname, phone, fax
    order by custid
    """
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