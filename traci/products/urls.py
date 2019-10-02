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
from products.views import ProductCreateView, ProductEditView, ProductDetailView, ProductDeleteView, \
    LifeCycleStageEntryCreateView, LifeCycleStageEntryEditView, LifeCycleStageEntryDetailView, \
    LifeCycleStageEntryDeleteView, ProcessCreateView, ProcessEditView, ProcessDetailView, ProcessDeleteView

urlpatterns = [
    # URLs for Product CRUD operations.
    url(r'^create/?$', ProductCreateView.as_view(), name='create_product'),
    url(r'^edit/(?P<pk>\d+)/?$', ProductEditView.as_view(), name='edit_product'),
    url(r'^detail/(?P<pk>\d+)/?$', ProductDetailView.as_view(), name='detail_product'),
    url(r'^delete/(?P<pk>\d+)/?$', ProductDeleteView.as_view(), name='delete_product'),

    # URLs for LifeCycleStageName CRUD operations.
    url(r'^lifecyclestage/create/?$', LifeCycleStageEntryCreateView.as_view(), name='lifecyclestage_create'),
    url(r'^lifecyclestage/edit/(?P<pk>\d+)/?$', LifeCycleStageEntryEditView.as_view(), name='edit_lifecyclestage'),
    url(r'^lifecyclestage/detail/(?P<pk>\d+)/?$', LifeCycleStageEntryDetailView.as_view(), name='detail_lifecyclestage'),
    url(r'^lifecyclestage/delete/(?P<pk>\d+)/?$', LifeCycleStageEntryDeleteView.as_view(), name='delete_lifecyclestage'),

    # URLs for Process CRUD operations.
    url(r'^process/create/?$', ProcessCreateView.as_view(), name='lifecyclestage_create'),
    url(r'^process/edit/(?P<pk>\d+)/?$', ProcessEditView.as_view(), name='edit_lifecyclestage'),
    url(r'^process/detail/(?P<pk>\d+)/?$', ProcessDetailView.as_view(), name='detail_lifecyclestage'),
    url(r'^process/delete/(?P<pk>\d+)/?$', ProcessDeleteView.as_view(), name='delete_lifecyclestage'),
]
