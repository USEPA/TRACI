# admin.py (projects)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""
Defines classes used to generate Django Admin portion of website.

Should be an Admin class for each Model that can be modified by an admin user.

Available functions:
- TBD
"""

from django.contrib import admin
from projects.models import Project

class ProjectAdmin(admin.ModelAdmin):
    """Define options used to display and edit Projects on the Django Admin page."""

    list_display = ('name', 'version', 'organization', 'contact', 'scope', 'description')
    search_fields = ('name', 'version', 'organization', 'contact', 'scope')
    list_per_page = 25


admin.site.register(Project, ProjectAdmin)
