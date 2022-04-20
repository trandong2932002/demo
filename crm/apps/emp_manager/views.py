from django.http import HttpRequest
from django.shortcuts import redirect, render
from crm.models import Employee
from .forms import EmployeeAddForm, EmployeeDeleteForm

# Create your views here.
def employee_manager(request: HttpRequest):
    emp_cols = [x.name for x in Employee._meta.fields][:13]
    employees = Employee.objects.all()

    new_emp = None
    if request.method == 'POST':
        emp_form_delete = None
        if 'delete' in request.POST:
            emp_form_delete = EmployeeDeleteForm(data=request.POST)
            if emp_form_delete.is_valid():
                empid = request.POST['delete_id']
                if empid != '':
                    emp_del = Employee.objects.get(empid = empid)
                    emp_del.delete()
                return redirect('/employees/')
        emp_form = EmployeeAddForm(data=request.POST)
        if 'add' in request.POST:
            if emp_form.is_valid():
                emp_form.cleaned_data
                new_emp = emp_form.save(commit=True)
                return redirect('/employees/')
        if 'edit' in request.POST:
            if emp_form.is_valid():
                empid = request.POST['empid']
                emp_edit = Employee.objects.get(empid=empid)
                for key, value in emp_form.cleaned_data.items():
                    setattr(emp_edit, key, value)
                emp_edit.save()
                return redirect('/employees/')
    else:
        emp_form = EmployeeAddForm()
        emp_form_delete = EmployeeDeleteForm()
    return render(request, 'employee/employees.html',
                  {'emp_cols': emp_cols, 'employees': employees,
                   'emp_form': emp_form, 'new_emp': new_emp,
                   'emp_form_delete': emp_form_delete})