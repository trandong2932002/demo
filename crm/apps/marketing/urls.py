from django.urls import path
from . import views

app_name = 'marketing'

urlpatterns = [
    path('', views.marketing, name='marketing'),
    path('send_email/<str:customer_string>', views.send_email, name='send_email'),
    path('post/ajax/customer_filter', views.ChangeCustomerFilter, name='customer_filter'),
]