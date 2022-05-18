from django.urls import path
from . import views

app_name = 'cus_info'

urlpatterns = [
    path('<int:custid>', views.customer_infomation, name='customer_infomation'),
    path('<int:custid>/<int:orderid>', views.customer_order, name='customer_order'),
    path('<int:custid>/<int:orderid>/post/ajax/order_detail', views.ChangeOrderDetail, name='order_detail'),
]