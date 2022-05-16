from django import forms
from crm.models import Salesorder, Employee, Shipper

#
def LoadEmployeeChoices():
    query_result = Employee.objects.all().values_list('empid', 'lastname', 'titleofcourtesy')
    choice_result = []
    for emp in query_result:
        empid = emp[0]
        emp_name = str(emp[2]) + ' ' + str(emp[1])
        choice_result.append((empid, emp_name))
    return choice_result

def LoadShipCompanyChoices():
    query_result = Shipper.objects.all().values_list('shipperid', 'companyname')
    choice_result = []
    for shipper in query_result:
        shipperid = shipper[0]
        shipper_name = shipper[1]
        choice_result.append((shipperid, shipper_name))
    return choice_result

EMPLOYEE_CHOICES = LoadEmployeeChoices()
SHIPPER_CHOICES = LoadShipCompanyChoices()


# FORM
class AddOrderDetailForm(forms.ModelForm):
    class Meta:
        model = Salesorder
        fields = '__all__'
        widgets = {
            'custid': forms.HiddenInput(),
            'orderdate': forms.DateInput(attrs={'type': 'date'}),
            'requireddate': forms.DateInput(attrs={'type': 'date'}),
            'shippeddate': forms.DateInput(attrs={'type': 'date'}),
            'empid': forms.Select(choices=EMPLOYEE_CHOICES, attrs={'class': 'form-control'}),
            'shipperid': forms.Select(choices=SHIPPER_CHOICES, attrs={'class': 'form-control'}),
        }

class DeleteOrderDetailForm(forms.Form):
    delete_id = forms.CharField(widget=forms.HiddenInput(), required=False)


