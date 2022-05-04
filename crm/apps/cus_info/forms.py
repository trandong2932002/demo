from django import forms
from crm.models import Orderdetail

class OrderDetailForm(forms.ModelForm):
    class Meta:
        model = Orderdetail
        fields = '__all__'