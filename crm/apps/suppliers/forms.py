from django import forms
from crm.models import Supplier

class SupplierAddForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(SupplierAddForm, self).__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'
            field.required = False
    class Meta:
        model = Supplier
        fields = '__all__'
        exclude = []

class SupplierDeleteForm(forms.Form):
    delete_id = forms.CharField(widget=forms.HiddenInput(), required=False)