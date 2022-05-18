from django import forms
from crm.models import Employee

class EmployeeAddForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(EmployeeAddForm, self).__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'
            field.required = False
    class Meta:
        model = Employee
        fields = '__all__'

class EmployeeDeleteForm(forms.Form):
    delete_id = forms.CharField(widget=forms.HiddenInput(), required=False)