from django import forms

class MyForm(forms.Form):
    a = forms.CharField()


class ShippedDate(forms.Form):
    shipped_date_start_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date'}))
    shipped_date_end_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date'}))

class OrderDiscount(forms.Form):
    order_discount_start_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date'}))
    order_discount_end_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date'}))