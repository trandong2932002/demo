from django import forms
from crm.models import Customer

class CustomerAddForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = '__all__'
        exclude = ['companyname', 'region', 'postalcode', 'fax']