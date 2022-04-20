from django.urls import path
from . import views


app_name = 'emp_manager'

urlpatterns = [
    path('', views.employee_manager, name='employee_manager'),
]