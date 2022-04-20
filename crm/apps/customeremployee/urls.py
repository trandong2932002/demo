from django.urls import path
from . import views

app_name = 'cus_emp'

urlpatterns = [
    path('<int:id>', views.customer_employee, name='customer_employee'),
]