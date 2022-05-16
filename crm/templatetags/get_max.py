from atexit import register
from django import template

register = template.Library()

@register.filter
def get_max(obj: list):
    return max(obj)

# max in list of dict by key
@register.filter
def get_max_in_dict(obj: list, key):
    return max(obj, key=lambda x:x[f'{key}'])[key]
