from lib2to3.pytree import Node
from django.http import HttpRequest
from django.shortcuts import redirect, render
from crm.models import Product
from .forms import ProductAddForm, ProductDeleteForm

# Create your views here.
def products(request: HttpRequest):
    # Product table
    pro_cols = [a.name for a in Product._meta.fields]
    pro_cols = [pro_cols[0], pro_cols[1], pro_cols[2], pro_cols[4],pro_cols[5], pro_cols[9]]
    products = Product.objects.all()

    # add product form
    new_pro = None
    if request.method == 'POST':
        product_form_delete = None
        if 'delete' in request.POST:
            # print(request.POST)
            product_form_delete = ProductDeleteForm(data=request.POST)
            if product_form_delete.is_valid():
                proid = request.POST['delete_id']
                if proid !='':
                    product_del = Product.objects.get(productid = proid)
                    product_del.delete()
                return redirect('/products/')

        product_form = ProductAddForm(data=request.POST)
        if('add' in request.POST):
            if product_form.is_valid():
                new_pro = product_form.save(commit=True)
                return redirect('/products/')
            
        if('edit' in request.POST):
            print(request.POST)
            if product_form.is_valid():
                prodid = request.POST['productid']
                product_edit = Product.objects.get(productid=prodid)
                for key, value in product_form.cleaned_data.items():
                    setattr(product_edit, key, value)
                product_edit.save()
                return redirect('/products/')
    else:
        pro_form = ProductAddForm()
        product_form_delete = ProductDeleteForm()
    return render(request, 'products/product.html',
                  {'pro_cols': pro_cols, 'products': products,
                   'pro_form': pro_form, 'new_pro': new_pro,
                   'product_form_delete': product_form_delete}) 