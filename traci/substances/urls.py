# urls.py (substances)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# pylint: disable=invalid-name
# We disable the invalid name because urlpatterns is the Django default

"""
URLs related to managing teams of users.

Available functions:
- REST api for substances
"""

from django.conf.urls import url
from substances.views import get_substances, get_units

urlpatterns = [units_for_type
    url(r'^api/substance_list/?$', get_substances, name='substance_list'),
    url(r'^api/units_for_type/?$', get_units, name='units_for_type'),
]
