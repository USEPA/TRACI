# urls.py (chemicals)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# pylint: disable=invalid-name
# We disable the invalid name because urlpatterns is the Django default

"""
URLs related to managing teams of users.

Available functions:
- REST api for chemicals
"""

from django.conf.urls import url
from chemicals.views import get_chemicals, get_units

urlpatterns = [
    url(r'^api/chemical_list/?$', get_chemicals, name='chemical_list'),
    url(r'^api/units_for_type/?$', get_units, name='units_for_type'),
]
