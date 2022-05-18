from django import forms
from crm.models import Orderdetail, Product, Salesorder, Employee, Shipper

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

def LoadProductChoices():
    query_result = Product.objects.all().values_list('productid', 'productname', 'unitprice')
    choice_result = [(x[0],x[1]) for x in query_result]
    choice_price = {str(x[0]): str(x[2]) for x in query_result}
    return choice_result, choice_price

EMPLOYEE_CHOICES = LoadEmployeeChoices()
SHIPPER_CHOICES = LoadShipCompanyChoices()
PRODUCT_CHOICES, PRODUCT_PRICE_CHOICES = LoadProductChoices()


# FORM
class AddOrderDetailForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(AddOrderDetailForm, self).__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'
            field.required = False
    class Meta:
        model = Salesorder
        fields = '__all__'
        widgets = {
            'custid': forms.HiddenInput(),
            'orderdate': forms.DateInput(attrs={'type': 'date'}),
            'requireddate': forms.DateInput(attrs={'type': 'date'}),
            'shippeddate': forms.DateInput(attrs={'type': 'date'}),
            'empid': forms.Select(choices=EMPLOYEE_CHOICES),
            'shipperid': forms.Select(choices=SHIPPER_CHOICES),
        }

class DeleteOrderDetailForm(forms.Form):
    delete_id = forms.CharField(widget=forms.HiddenInput(), required=False)

class EditOrderDetailForm(forms.ModelForm):
    amount = forms.CharField(widget=forms.TextInput(attrs={'readonly': True}))
    def __init__(self, *args, **kwargs):
        super(EditOrderDetailForm, self).__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'
            field.required = False
    class Meta:
        model = Orderdetail
        fields = '__all__'
        widgets = {'orderid': forms.HiddenInput(),
                   'unitprice': forms.TextInput(attrs={'readonly': True}),
                   'productid': forms.Select(choices=PRODUCT_CHOICES)}
