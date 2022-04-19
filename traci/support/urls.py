# urls.py (support)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# pylint: disable=invalid-name
# We disable the invalid name because urlpatterns is the Django default
"""
Module related to urls for support.

Available functions:
- N/A
"""

from django.urls import re_path
from support.views import RequestInformationView, UserManualView, \
    create_support, EventsView, edit_support, edit_support_admin, \
    delete_support, list_supports, search_support, show_support, \
    create_support_type, edit_support_type, delete_support_type, \
    list_support_types, search_support_type, show_support_type, \
    create_priority, edit_priority, delete_priority, list_priorities, \
    search_priority, show_priority, search_support_for_last_30, \
    search_support_for_last_60, search_support_for_last_90, \
    search_support_for_last_180, index

urlpatterns = [
    re_path(r'^$', index),
    re_path(r'^index/$', index, name='go_to_support'),
    re_path(r'^request_info/$',
        RequestInformationView.as_view(),
        name="request_info"),
    re_path(r'^documentation/$', UserManualView.as_view(), name="documentation"),
    re_path(r'events/', EventsView.as_view(), name='events'),
    re_path(r'^create/$', create_support, name='create_support'),
    re_path(r'^edit/(?P<obj_id>\d+)/$', edit_support, name='edit_support'),
    re_path(r'^edit/admin/(?P<obj_id>\d+)/$',
        edit_support_admin,
        name='edit_support_admin'),
    re_path(r'^delete/(?P<obj_id>\d+)/$', delete_support, name='delete_support'),
    re_path(r'^list/$', list_supports, name='list_supports'),
    re_path(r'^search/$', search_support, name='search_support'),
    # re_path(r'^search/result/$', result_search_support,
    #    name='result_search_support'),
    re_path(r'^show/(?P<obj_id>\d+)/$', show_support, name='show_support'),
    re_path(r'^type/create/$', create_support_type, name='create_support_type'),
    re_path(r'^type/edit/(?P<obj_id>\d+)/$',
        edit_support_type,
        name='edit_support_type'),
    re_path(r'^type/delete/(?P<obj_id>\d+)/$',
        delete_support_type,
        name='delete_support_type'),
    re_path(r'^type/list/$', list_support_types, name='list_support_types'),
    re_path(r'^type/search/$', search_support_type, name='search_support_type'),
    # re_path(r'^type/search/result/$', result_search_support_type,
    #    name='result_search_support_type'),
    re_path(r'^type/show/(?P<obj_id>\d+)/$',
        show_support_type,
        name='show_support_type'),
    re_path(r'^priority/create/$', create_priority, name='create_priority'),
    re_path(r'^priority/edit/(?P<obj_id>\d+)/$',
        edit_priority,
        name='edit_priority'),
    re_path(r'^priority/delete/(?P<obj_id>\d+)/$',
        delete_priority,
        name='delete_priority'),
    re_path(r'^priority/list/$', list_priorities, name='list_priorities'),
    re_path(r'^priority/search/$', search_priority, name='search_priority'),
    # re_path(r'^priority/search/result/$', result_search_priority,
    #    name='result_search_priority'),
    re_path(r'^priority/show/(?P<obj_id>\d+)/$',
        show_priority,
        name='show_priority'),
    re_path(r'^support/search/result/thirty/$',
        search_support_for_last_30,
        name='search_support_for_last_30'),
    re_path(r'^support/search/result/sixty/$',
        search_support_for_last_60,
        name='search_support_for_last_60'),
    re_path(r'^support/search/result/ninety/$',
        search_support_for_last_90,
        name='search_support_for_last_90'),
    re_path(r'^support/search/result/one_eighty/$',
        search_support_for_last_180,
        name='search_support_for_last_180'),
]
