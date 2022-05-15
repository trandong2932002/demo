from django import forms

class MyForm(forms.Form):
    a = forms.CharField()


class ShippedDate(forms.Form):
    shipped_date_start_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2005-01-01', 'max': '2023-01-01'}))
    shipped_date_end_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2005-01-01', 'max': '2023-01-01'}))

class OrderDiscount(forms.Form):
    order_discount_start_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2005-01-01', 'max': '2023-01-01'}))
    order_discount_end_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2005-01-01', 'max': '2023-01-01'}))