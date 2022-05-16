from django import forms
from crm.models import Category


#
def LoadCategoryChoices():
    query_result = Category.objects.all().values_list('categoryid', 'categoryname').order_by('categoryid')
    choice_result = [x for x in query_result]
    choice_result.append((len(choice_result)+1, 'All'))
    choice_result.append((len(choice_result)+1, 'Combine'))
    return choice_result

CATEGORY_CHOICES = LoadCategoryChoices()

# FORMS
class ShippedDate(forms.Form):
    shipped_date_start_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2006-01-01', 'max': '2023-01-01'}))
    shipped_date_end_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2006-01-01', 'max': '2023-01-01'}))

class OrderDiscount(forms.Form):
    order_discount_start_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2006-01-01', 'max': '2023-01-01'}))
    order_discount_end_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2006-01-01', 'max': '2023-01-01'}))

class Revenue(forms.Form):
    category = forms.ChoiceField(choices=CATEGORY_CHOICES)
    revenue_start_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2006-01-01', 'max': '2023-01-01'}))
    revenue_end_at = forms.DateField(widget=forms.widgets.DateInput(attrs={'type': 'date', 'min': '2006-01-01', 'max': '2023-01-01'}))