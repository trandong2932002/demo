from django.http import HttpRequest
from django.shortcuts import redirect, render
from crm.models import Customer, Customeremployee, Employee
from .forms import SentCheckboxCheckedForm
# Create your views here.
def customer_employee(request: HttpRequest, id):
    if request.method == 'POST':
        cusemp_form = SentCheckboxCheckedForm(data=request.POST)
        if cusemp_form.is_valid():
            cusemp_after_str = request.POST['checkbox'][:-1].split(',')
            temp = Customeremployee.objects.filter(custid=id).values_list('empid').order_by('empid')
            cusemp_before = [x for x, in temp]
            cusemp_after = []
            for x in cusemp_after_str:
                a, b = x.split('_')
                if b == 'true':
                    cusemp_after.append(int(a))
            print(cusemp_before)
            print(cusemp_after)
            while len(cusemp_before) > 0:
                x = cusemp_before[0]
                if x in cusemp_after: # before, after -> pass
                    cusemp_after.remove(x)
                elif x not in cusemp_after: # before, not in after -> delete
                    Customeremployee.objects.get(empid=x, custid=id).delete()
                cusemp_before.remove(x)
            for x in cusemp_after: # not in before, after -> add
                temp = Customeremployee(empid=x, custid=id)
                temp.save()
            return redirect('/customeremployee/' + str(id))
    else:
        cusemp_form = SentCheckboxCheckedForm()

        cus = Customer.objects.filter(custid=id).values_list('custid', 'contactname')
        cus = [x for y in cus for x in y]
        cusemp_cols = ['select', 'empid', 'lastname', 'firstname', 'title', 'titleofcourtesy']
        cusemps = Customeremployee.objects.filter(custid=id).values_list('empid')
        empsid = [x for x, in cusemps]
        cusemps = []
        for emp in Employee.objects.values_list('empid', 'lastname', 'firstname', 'title', 'titleofcourtesy'):
            if emp[0] in empsid:
                cusemps.append(('True',)+emp)
            else:
                cusemps.append(('False',)+emp)
    return render(request, 'customeremployee/customeremployee.html',
                  {'cus': cus, 'cusemps': cusemps, 'cusemp_cols': cusemp_cols,
                   'cusemp_form': cusemp_form})