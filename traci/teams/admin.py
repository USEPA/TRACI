# admin.py (teams)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Define classes used to generate Django Admin portion of the website.

Available functions:
- Sets Teams
- Sets Team Memberships
"""

from django.contrib import admin
from teams.models import Team, TeamMembership

admin.site.register(Team)
admin.site.register(TeamMembership)
