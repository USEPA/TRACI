# urls.py (traci)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of urls for traci."""

from datetime import datetime
from django.conf.urls import url
from django.urls import include

from traci.forms import BootstrapAuthenticationForm
from traci.views import home, contact, about, DashboardView, citation, \
    download_manual, download_excel_tool

from django.conf.urls import include
from django.contrib import admin
admin.autodiscover()

urlpatterns = [
    url('admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', admin.site.urls),
    url(r'^$', home, name='home'),
    url(r'^contact$', contact, name='contact'),
    url(r'^about$', about, name='about'),
    url(r'^dashboard/$', DashboardView.as_view(), name='dashboard'),
    url(r'^support/', include('support.urls')),
    url(r'^teams/', include('teams.urls')),

    url(r'^citation/$', citation, name='citation'),
    url(r'^download_manual/$', download_manual, name="download_manual"),
    url(r'^download_excel_tool/$', download_excel_tool, name="download_excel_tool"),

    # User profile / accounts pages.
    url(r'^accounts/', include('accounts.urls')),

    # url(r'^login/$', django.contrib.auth.views.LoginView,
    #    {'template_name': 'login.html', 'authentication_form': BootstrapAuthenticationForm,
    #     'extra_context': {'title': 'Log in', 'year': datetime.now().year,}}, name='login'),
    # url(r'^logout$', django.contrib.auth.views.LogoutView, {'next_page': '/', }, name='logout'),
]
