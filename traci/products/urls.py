# urls.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# pylint: disable=invalid-name
# We disable the invalid name because urlpatterns is the Django default

"""
URLs related to managing Products

Available functions:
- None yet
"""

from django.conf.urls import url
from products.views import *

urlpatterns = [
    url(r'^create/?$', ProductCreateView.as_view(), name='create_product'),
    url(r'^create/lifecyclestage/?$', ProductCreateView.as_view(), name='create_lifecyclestage'),

    url(r'^edit/(?P<pk>\d+)/?$', ProductEditView.as_view(), name='edit_product'),

    url(r'^detail/(?P<pk>\d+)/?$', ProductDetailView.as_view(), name='detail_product'),

    url(r'^delete/(?P<pk>\d+)/?$', ProductDeleteView.as_view(), name='delete_product'),
]
