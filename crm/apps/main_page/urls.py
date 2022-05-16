from django.urls import path
from . import views

app_name = 'main_page'

urlpatterns = [
    path('', views.main_page, name='main_page'),
    path('post/ajax/shipped_date', views.ChangeShippedDate, name='shipped_date'),
    path('post/ajax/order_discount', views.ChangeOrderDiscount, name='order_discount'),
    path('post/ajax/revenue', views.ChangeRevenue, name='revenue'),
]