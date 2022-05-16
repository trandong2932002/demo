from atexit import register
from datetime import datetime
from django import template

register = template.Library()

@register.filter
def get_year_month(obj: datetime):
    return obj.strftime("%b %Y")