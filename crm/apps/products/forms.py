from django import forms
from crm.models import Product

class ProductAddForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(ProductAddForm, self).__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'
            field.required = False
    class Meta:
        model = Product
        fields = '__all__'
        exclude = []

class ProductDeleteForm(forms.Form):
    delete_id = forms.CharField(widget=forms.HiddenInput(), required=False)