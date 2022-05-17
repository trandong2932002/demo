from django.urls import path
from . import views

app_name = 'marketing'

urlpatterns = [
    path('', views.marketing, name='marketing'),
    path('post/ajax/customer_filter', views.ChangeCustomerFilter, name='customer_filter'),
]