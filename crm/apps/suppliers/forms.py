from django import forms
from crm.models import Supplier

class SupplierAddForm(forms.ModelForm):
    class Meta:
        model = Supplier
        fields = '__all__'
        exclude = []

class SupplierDeleteForm(forms.Form):
    delete_id = forms.CharField(widget=forms.HiddenInput(), required=False)