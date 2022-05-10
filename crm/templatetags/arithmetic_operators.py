from atexit import register
from django import template

register = template.Library()

@register.filter
def mul(a, b):
    return float(a) * float(b)

@register.filter
def div(a, b):
    return float(a) / float(b)
