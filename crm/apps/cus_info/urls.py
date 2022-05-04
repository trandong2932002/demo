from django.urls import path
from . import views

app_name = 'cus_info'

urlpatterns = [
    path('<int:custid>', views.customer_infomation, name='customer_infomation'),
]