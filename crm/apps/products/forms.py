from django import forms
from crm.models import Product

class ProductAddForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = '__all__'
        exclude = []

class ProductDeleteForm(forms.Form):
    delete_id = forms.CharField(widget=forms.HiddenInput(), required=False)