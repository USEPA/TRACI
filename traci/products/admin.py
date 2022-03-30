# admin.py (products)
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
from products.models import Media, Process, LifeCycleStageName, Product


class MediaAdmin(admin.ModelAdmin):
    """
    Define options used to display and edit Media on the Django Admin page.
    """

    list_display = ('name', )
    search_fields = ('name', )
    list_per_page = 25


admin.site.register(Media, MediaAdmin)

# class LocationAdmin(admin.ModelAdmin):
#     """
#     Define options used to display and edit
#     Location on the Django Admin page.
#     """

#     list_display = ('name', 'parent')
#     search_fields = ('name', 'parent')
#     list_per_page = 50

# admin.site.register(Location, LocationAdmin)

# class ResourceReleaseOptionAdmin(admin.ModelAdmin):
#     """
#     Define options used to display and edit
#     ResourceReleaseOption on the Django Admin page.
#     """

#     list_display = ('name',)
#     search_fields = ('name',)
#     list_per_page = 25

# admin.site.register(ResourceReleaseOption, ResourceReleaseOptionAdmin)

# class ResourceReleaseAdmin(admin.ModelAdmin):
#     """
#     Define options used to display and edit ResourceRelease
#     on the Django Admin page.
#     """

#     list_display = ('name',)
#     search_fields = ('name',)
#     list_per_page = 25

# admin.site.register(ResourceRelease, ResourceReleaseAdmin)


class ProcessAdmin(admin.ModelAdmin):
    """
    Define options used to display and edit Process on the Django Admin page.
    """

    list_display = ('name', 'location')
    search_fields = ('name', 'location')
    list_per_page = 25


admin.site.register(Process, ProcessAdmin)


class LifeCycleStageAdmin(admin.ModelAdmin):
    """
    Define options used to display and edit
    LifeCycleStageName on the Django Admin page.
    """

    list_display = ('name', )
    search_fields = ('name', )
    list_per_page = 25


admin.site.register(LifeCycleStageName, LifeCycleStageAdmin)


class ProductAdmin(admin.ModelAdmin):
    """
    Define options used to display and edit Product on the Django Admin page.
    """

    list_display = ('name', )
    search_fields = ('name', )
    list_per_page = 25


admin.site.register(Product, ProductAdmin)
