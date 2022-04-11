from django.urls import path
from . import views

app_name = 'cus_manager'

urlpatterns = [
    path('', views.customer_manager, name='customer_manager'),
]