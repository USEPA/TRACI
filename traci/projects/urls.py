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

from django.conf.urls import url
from projects.views import ProjectListView, ProjectCreateView, get_projects, ProjectEditView, \
    ProjectDetailView, ProjectDeleteView

urlpatterns = [
    url(r'^projects/$', ProjectListView.as_view(), name='projects'),
    url(r'^create/$', ProjectCreateView.as_view(), name='create_project'),
    url(r'^edit/(?P<pk>\d+)/$', ProjectEditView.as_view(), name='edit_project'),
    url(r'^detail/(?P<pk>\d+)/$', ProjectDetailView.as_view(), name='detail_project'),
    url(r'^delete/(?P<pk>\d+)/$', ProjectDeleteView.as_view(), name='delete_project'),
    url(r'^get_projects/$', get_projects, name='get_projects'),
]
