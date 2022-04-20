from django import forms

class SentCheckboxCheckedForm(forms.Form):
    checkbox = forms.CharField(widget=forms.HiddenInput(), required=False)