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

from django.urls import re_path
from products.views import ProductCreateView, ProductEditView, \
    ProductDetailView, ProductDeleteView, LifeCycleStageCreateView, \
    LifeCycleStageEditView, LifeCycleStageDetailView, \
    LifeCycleStageDeleteView, ProcessCreateView, ProcessEditView, \
    ProcessDetailView, ProcessDeleteView, ResourceReleaseCreateView, \
    ReleaseEditView, ResourceEditView, ReleaseDeleteView, ResourceDeleteView, \
    release_factor_view, resource_factor_view

urlpatterns = [
    # URLs for Product CRUD operations.
    re_path(r'^create/?$', ProductCreateView.as_view(), name='create_product'),
    re_path(r'^edit/(?P<pk>\d+)/?$',
        ProductEditView.as_view(),
        name='edit_product'),
    re_path(r'^detail/(?P<pk>\d+)/?$',
        ProductDetailView.as_view(),
        name='detail_product'),
    re_path(r'^delete/(?P<pk>\d+)/?$',
        ProductDeleteView.as_view(),
        name='delete_product'),

    # URLs for LifeCycleStageName CRUD operations.
    re_path(r'^lifecyclestage/create/?$',
        LifeCycleStageCreateView.as_view(),
        name='lifecyclestage_create'),
    re_path(r'^lifecyclestage/edit/(?P<pk>\d+)/?$',
        LifeCycleStageEditView.as_view(),
        name='edit_lifecyclestage'),
    re_path(r'^lifecyclestage/detail/(?P<pk>\d+)/?$',
        LifeCycleStageDetailView.as_view(),
        name='detail_lifecyclestage'),
    re_path(r'^lifecyclestage/delete/(?P<pk>\d+)/?$',
        LifeCycleStageDeleteView.as_view(),
        name='delete_lifecyclestage'),

    # URLs for Process CRUD operations.
    re_path(r'^process/create/?$',
        ProcessCreateView.as_view(),
        name='create_process'),
    re_path(r'^process/edit/(?P<pk>\d+)/?$',
        ProcessEditView.as_view(),
        name='edit_process'),
    re_path(r'^process/detail/(?P<pk>\d+)/?$',
        ProcessDetailView.as_view(),
        name='detail_process'),
    re_path(r'^process/delete/(?P<pk>\d+)/?$',
        ProcessDeleteView.as_view(),
        name='delete_process'),

    # URLs for ResourceRelease CRUD operations.
    re_path(r'^resourcerelease/create/?$',
        ResourceReleaseCreateView.as_view(),
        name='create_resourcerelease'),
    # URLs for Release
    re_path(r'^release/edit/(?P<pk>\d+)/?$',
        ReleaseEditView.as_view(),
        name='edit_release'),
    re_path(r'^release/delete/(?P<pk>\d+)/?$',
        ReleaseDeleteView.as_view(),
        name='delete_release'),
    re_path(r'^release/factors/(?P<pk>\d+)/?$',
        release_factor_view,
        name='release_factors'),
    # URLs for Resource
    re_path(r'^resource/edit/(?P<pk>\d+)/?$',
        ResourceEditView.as_view(),
        name='edit_resource'),
    re_path(r'^resource/delete/(?P<pk>\d+)/?$',
        ResourceDeleteView.as_view(),
        name='delete_resource'),
    re_path(r'^resource/factors/(?P<pk>\d+)/?$',
        resource_factor_view,
        name='delete_resource'),
]
