from django import forms
from crm.apps.main_page.forms import CATEGORY_CHOICES
from crm.models import Customer


def GetCustomerCountryChoices():
    query_result = Customer.objects.all().values_list('country').order_by('country').distinct()
    choice_result = [(i,x[0]) for i,x in enumerate(query_result, 1)]
    choice_result.append((len(choice_result)+1,'All'))
    return choice_result


# CHOICE
MARKETING_CATEGORY_CHOICES = CATEGORY_CHOICES.copy()
MARKETING_CATEGORY_CHOICES.pop()
CUSTOMER_COUNTRY_CHOICES = GetCustomerCountryChoices()


# FORM
class CustomerFilter(forms.Form):
    # time
    start_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2006-01-01', 'max': '2023-01-01'}), initial='2006-01-01')
    end_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2006-01-01', 'max': '2023-01-01'}), initial='2006-01-01')
    # category: amount, qty, (add more)
    category = forms.ChoiceField(choices=MARKETING_CATEGORY_CHOICES, initial='9')
    # customer: country, (add more)
    country = forms.ChoiceField(choices=CUSTOMER_COUNTRY_CHOICES, initial='22')

class SendEmail(forms.Form):
    subject = forms.CharField(max_length=25, widget=forms.TextInput(attrs={'class': 'form-control',}), initial='Enter Subject')
    to = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control',}))
    cc = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control',}), required=False)
    bcc = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control',}), required=False)
    body = forms.CharField(required=False, widget=forms.Textarea(attrs={'class': 'form-control',}), initial='Enter Body')