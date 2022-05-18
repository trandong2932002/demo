from django import forms
from crm.models import Customer

class CustomerAddForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(CustomerAddForm, self).__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'
            field.required = False

    class Meta:
        model = Customer
        fields = '__all__'

class CustomerDeleteForm(forms.Form):
    delete_id = forms.CharField(widget=forms.HiddenInput(), required=False)