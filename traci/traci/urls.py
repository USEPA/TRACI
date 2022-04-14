# urls.py (traci)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
"""Definition of urls for traci."""

from django.urls import re_path
from django.contrib import admin
from django.urls import include

from traci.views import home, contact, about, DashboardView, citation, \
    download_manual, download_excel_tool, ScenarioView

admin.autodiscover()

urlpatterns = [
    re_path('admin/doc/?', include('django.contrib.admindocs.urls')),
    re_path(r'^admin/?', admin.site.urls),
    re_path(r'^$', home, name='home'),
    re_path(r'^contact/?$', contact, name='contact'),
    re_path(r'^about/?$', about, name='about'),
    re_path(r'^dashboard/?$', DashboardView.as_view(), name='dashboard'),
    re_path(r'^scenario/?$', ScenarioView.as_view(), name='scenario'),
    re_path(r'^support/', include('support.urls')),
    re_path(r'^chemicals/', include('chemicals.urls')),
    re_path(r'^teams/', include('teams.urls')),
    re_path(r'^products/', include('products.urls')),
    re_path(r'^projects/', include('projects.urls')),
    re_path(r'^citation/?$', citation, name='citation'),
    re_path(r'^download_manual/?$', download_manual, name="download_manual"),
    re_path(r'^download_excel_tool/?$',
        download_excel_tool,
        name="download_excel_tool"),

    # User profile / accounts pages.
    re_path(r'^accounts/', include('accounts.urls')),
]
