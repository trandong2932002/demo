from atexit import register
from django import template

register = template.Library()

@register.filter
def zip_lists(a: list, b: list):
    return zip(a,b)