from django.http import HttpRequest
from django.shortcuts import render
from crm.models import Customer
from .forms import CustomerAddForm

# Create your views here.
def customer_manager(request: HttpRequest):
    # customers table
    cus_cols = [a.name for a in Customer._meta.fields]
    cus_cols = [cus_cols[0], cus_cols[2], cus_cols[3], cus_cols[4],
                cus_cols[5], cus_cols[8], cus_cols[9]]
    customers = Customer.objects.all()[:10]

    # add customer form
    new_cus = None
    if request.method == 'POST':
        cus_form = CustomerAddForm(data=request.POST)
        if cus_form.is_valid():
            new_cus = cus_form.save(commit=True)
    else:
        cus_form = CustomerAddForm()
    return render(request, 'customer/customer.html',
                  {'cus_cols': cus_cols, 'customers': customers,
                   'cus_form': cus_form, 'new_cus': new_cus}) # new cus: check commit success