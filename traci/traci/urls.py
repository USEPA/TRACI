# urls.py (traci)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""
Definition of urls for traci.
"""

from datetime import datetime
from django.conf.urls import url
import django.contrib.auth.views

from traci.forms import BootstrapAuthenticationForm
from traci.views import home, contact, about

# Uncomment the next lines to enable the admin:
# from django.conf.urls import include
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = [
    # Examples:
    url(r'^$', home, name='home'),
    url(r'^contact$', contact, name='contact'),
    url(r'^about$', about, name='about'),
    url(r'^login/$',
        django.contrib.auth.views.LoginView,
        {
            'template_name': 'login.html',
            'authentication_form': BootstrapAuthenticationForm,
            'extra_context':
            {
                'title': 'Log in',
                'year': datetime.now().year,
            }
        },
        name='login'),
    url(r'^logout$',
        django.contrib.auth.views.LogoutView,
        {
            'next_page': '/',
        },
        name='logout'),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
]
