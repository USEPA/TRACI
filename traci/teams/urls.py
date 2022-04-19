# urls.py (teams)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# pylint: disable=invalid-name
# We disable the invalid name because urlpatterns is the Django default
"""
URLs related to managing teams of users.

Available functions:
- REST api for teams
- Team management
"""

from django.urls import re_path
from teams.views import APITeamListView, APITeamDetailView, \
    APITeamMembershipListView, APITeamMembershipDetailView, \
    TeamCreateView, TeamManagementView, TeamEditView

urlpatterns = [

    # REST api for teams.
    re_path(r'^api/team/$', APITeamListView.as_view(), name='api_team_list'),
    re_path(r'^api/team/(?P<team_id>\d+)/$',
        APITeamDetailView.as_view(),
        name='api_team_detail'),
    re_path(r'^api/team/(?P<team_id>\d+)/membership/$',
        APITeamMembershipListView.as_view(),
        name='api_team_membership_list'),
    re_path(r'^api/team/(?P<team_id>\d+)/membership/(?P<membership_id>\d+)/$',
        APITeamMembershipDetailView.as_view(),
        name='api_team_membership_detail'),

    # Team management.
    re_path(r'^team/$', TeamCreateView.as_view(), name='team_create'),
    re_path(r'^team/(?P<team_id>\d+)/manage$',
        TeamManagementView.as_view(),
        name='team_manage'),
    re_path(r'^team/(?P<team_id>\d+)/edit$',
        TeamEditView.as_view(),
        name='team_edit'),
]
