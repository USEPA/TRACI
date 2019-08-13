# admin.py (accounts)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Defines classes used to generate 'Accounts' Django Admin portion of website.

There should be Admin class for each Model that can be modified by admin user.

Available functions:
- None for this module -- TBD (would like added to manage in Django Admin)
"""

from django.contrib import admin
from accounts.models import UserProfile


class UserProfileAdmin(admin.ModelAdmin):
    """Assigns 'USER ID' number, once user registers with HELP."""

    list_display = ("user_id", )
    search_fields = ("user__username",)
    exclude = ('created_by', 'last_modified_by',)
    list_filter = ("user_id",)
    list_per_page = 25


admin.site.register(UserProfile, UserProfileAdmin)
