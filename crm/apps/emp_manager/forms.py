from django import forms
from crm.models import Employee

class EmployeeAddForm(forms.ModelForm):
    class Meta:
        model = Employee
        fields = '__all__'

class EmployeeDeleteForm(forms.Form):
    delete_id = forms.CharField(widget=forms.HiddenInput(), required=False)