from django import forms
from crm.models import Customer

class CustomerAddForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = '__all__'

class CustomerDeleteForm(forms.Form):
    delete_id = forms.CharField(widget=forms.HiddenInput(), required=False)