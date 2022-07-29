# urls.py (projects)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# pylint: disable=invalid-name
# We disable the invalid name because urlpatterns is the Django default
"""
URLs related to managing projects

Available functions:
- None yet
"""

from django.urls import re_path
from projects.views import ProjectListView, ProjectCreateView, get_projects, \
    ProjectEditView, ProjectDetailView, ProjectDeleteView, \
    ProjectCalculationsView

urlpatterns = [
    re_path(r'^projects/?$', ProjectListView.as_view(), name='projects'),
    re_path(r'^create/?$', ProjectCreateView.as_view(), name='create_project'),
    re_path(r'^edit/(?P<pk>\d+)/?$',
        ProjectEditView.as_view(),
        name='edit_project'),
    re_path(r'^detail/(?P<pk>\d+)/?$',
        ProjectDetailView.as_view(),
        name='detail_project'),
    re_path(r'^delete/(?P<pk>\d+)/?$',
        ProjectDeleteView.as_view(),
        name='delete_project'),
    re_path(r'^calculations/(?P<pk>\d+)/?$',
        ProjectCalculationsView.as_view(),
        name='delete_project'),
    re_path(r'^get_projects/?$', get_projects, name='get_projects'),
]
