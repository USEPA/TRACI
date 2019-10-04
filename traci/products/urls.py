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
    LifeCycleStageCreateView, LifeCycleStageEditView, LifeCycleStageDetailView, \
    LifeCycleStageDeleteView, ProcessCreateView, ProcessEditView, ProcessDetailView, ProcessDeleteView, \
    ResourceReleaseCreateView, ResourceReleaseEditView, ResourceReleaseDetailView, ResourceReleaseDeleteView

urlpatterns = [
    # URLs for Product CRUD operations.
    url(r'^create/?$', ProductCreateView.as_view(), name='create_product'),
    url(r'^edit/(?P<pk>\d+)/?$', ProductEditView.as_view(), name='edit_product'),
    url(r'^detail/(?P<pk>\d+)/?$', ProductDetailView.as_view(), name='detail_product'),
    url(r'^delete/(?P<pk>\d+)/?$', ProductDeleteView.as_view(), name='delete_product'),

    # URLs for LifeCycleStageName CRUD operations.
    url(r'^lifecyclestage/create/?$', LifeCycleStageCreateView.as_view(), name='lifecyclestage_create'),
    url(r'^lifecyclestage/edit/(?P<pk>\d+)/?$', LifeCycleStageEditView.as_view(), name='edit_lifecyclestage'),
    url(r'^lifecyclestage/detail/(?P<pk>\d+)/?$', LifeCycleStageDetailView.as_view(), name='detail_lifecyclestage'),
    url(r'^lifecyclestage/delete/(?P<pk>\d+)/?$', LifeCycleStageDeleteView.as_view(), name='delete_lifecyclestage'),

    # URLs for Process CRUD operations.
    url(r'^process/create/?$', ProcessCreateView.as_view(), name='create_process'),
    url(r'^process/edit/(?P<pk>\d+)/?$', ProcessEditView.as_view(), name='edit_process'),
    url(r'^process/detail/(?P<pk>\d+)/?$', ProcessDetailView.as_view(), name='detail_process'),
    url(r'^process/delete/(?P<pk>\d+)/?$', ProcessDeleteView.as_view(), name='delete_process'),

    # URLs for ResourceRelease CRUD operations.
    url(r'^resourcerelease/create/?$', ResourceReleaseCreateView.as_view(), name='create_resourcerelease'),
    url(r'^resourcerelease/edit/(?P<pk>\d+)/?$', ResourceReleaseEditView.as_view(), name='edit_resourcerelease'),
    url(r'^resourcerelease/detail/(?P<pk>\d+)/?$', ResourceReleaseDetailView.as_view(), name='detail_resourcerelease'),
    url(r'^resourcerelease/delete/(?P<pk>\d+)/?$', ResourceReleaseDeleteView.as_view(), name='delete_resourcerelease'),
]
