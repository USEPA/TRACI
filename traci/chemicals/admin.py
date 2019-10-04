# admin.py (chemicals)
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
from chemicals.models import Chemical

class ChemicalAdmin(admin.ModelAdmin):
    """Define options used to display and edit Chemicals on the Django Admin page."""

    list_display = ('name', 'formatted_cas')
    search_fields = ('name', 'cas', 'formatted_cas')
    list_per_page = 100


admin.site.register(Chemical, ChemicalAdmin)
