"""crm URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('main/', include('main_page.urls', namespace='main_page')),
    path('customers/', include('cus_manager.urls', namespace='cus_manager')),
    path('employees/', include('emp_manager.urls', namespace='emp_manager')),
    path('customeremployee/', include('customeremployee.urls', namespace='cus_emp')),
    path('marketing/', include('marketing.urls', namespace='marketing')),
]
