from django.http import HttpRequest
from django.shortcuts import redirect, render
from crm.models import Customer
from .forms import CustomerAddForm,  CustomerDeleteForm

# Create your views here.
def customer_manager(request: HttpRequest):
    # customers table
    cus_cols = [a.name for a in Customer._meta.fields]
    customers = Customer.objects.all()

    # add customer form
    new_cus = None
    if request.method == 'POST':
        cus_form_delete = None
        if 'delete' in request.POST:
            cus_form_delete = CustomerDeleteForm(data=request.POST)
            if cus_form_delete.is_valid():
                custid = request.POST['delete_id']
                if custid != '':
                    cus_del = Customer.objects.get(custid=custid)
                    cus_del.delete()
                return redirect('/customers/')
        cus_form = CustomerAddForm(data=request.POST)
        if 'add' in request.POST:
            if cus_form.is_valid():
                cus_form.cleaned_data
                new_cus = cus_form.save(commit=True)
                return redirect('/customers/')
        if 'edit' in request.POST:
            if cus_form.is_valid():
                custid = request.POST['custid']
                cus_edit = Customer.objects.get(custid=custid)
                for key, value in cus_form.cleaned_data.items():
                    setattr(cus_edit, key, value)
                cus_edit.save()
                return redirect('/customers/')
        
    else:
        cus_form = CustomerAddForm()
        cus_form_delete = CustomerDeleteForm()
    return render(request, 'customer/customers.html',
                  {'cus_cols': cus_cols, 'customers': customers,
                   'cus_form': cus_form, 'new_cus': new_cus, # new cus: check commit success
                   'cus_form_delete': cus_form_delete})