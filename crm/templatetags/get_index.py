from atexit import register
from django import template

register = template.Library()

@register.filter
def get_index(obj: list, index):
    return obj[int(index)]