from django.http import HttpRequest
from django.shortcuts import render,redirect
from crm.models import  Supplier
from .forms import SupplierAddForm, SupplierDeleteForm

# Create your views here.
def supplier(request: HttpRequest):
    # Product table
    supplier_cols = [a.name for a in Supplier._meta.fields]
    # supplier_cols = [pro_cols[0], pro_cols[1], pro_cols[2], pro_cols[4],pro_cols[5], pro_cols[9]]
    suppliers = Supplier.objects.all()

    # add product form
    new_supplier = None
    if request.method == 'POST':
        supplier_form_delete = None
        if 'delete' in request.POST:
            print(request.POST)
            supplier_form_delete = SupplierDeleteForm(data=request.POST)
            if supplier_form_delete.is_valid():
                supplid = request.POST['delete_id']
                if supplid != '':
                    supplier_del = Supplier.objects.get(supplierid=supplid)
                    supplier_del.delete()
                return redirect('/suppliers/')

        supplier_form = SupplierAddForm(data=request.POST)
        if 'add' in request.POST:
            print(request.POST)
            if supplier_form.is_valid():
                # cus_form.cleaned_data
                new_supplier = supplier_form.save(commit=True)
                return redirect('/suppliers/')
        if 'edit' in request.POST:
            if  supplier_form.is_valid():
                supplid = request.POST['supplierid']
                supplier_edit = Supplier.objects.get(supplierid=supplid)
                for key, value in supplier_form.cleaned_data.items():
                    setattr(supplier_edit, key, value)
                supplier_edit.save()
                return redirect('/suppliers/')
        
    else:
        supplier_form = SupplierAddForm()
        supplier_form_delete = SupplierDeleteForm()
    return render(request, 'supplier/supplier.html',
                  {'supplier_cols': supplier_cols, 'suppliers': suppliers,
                   'supplier_form': supplier_form, 'new_supplier': new_supplier, # new cus: check commit success
                   'supplier_form_delete': supplier_form_delete})