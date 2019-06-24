# admin.py (support)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Support admin classes fileself.

Defines classes used to generate Django Admin portion of the website.
Available functions:
- None for this module -- TBD (would like added to manage in Django Admin)
"""

from django.contrib import admin
from support.models import Support, SupportType, Priority, InformationRequest

admin.site.register(Support)
admin.site.register(SupportType)
admin.site.register(Priority)
admin.site.register(InformationRequest)
