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

from django.conf.urls import url
from teams.views import APITeamListView, APITeamDetailView, \
    APITeamMembershipListView, APITeamMembershipDetailView, \
    TeamCreateView, TeamManagementView, TeamEditView

urlpatterns = [

    # REST api for teams.
    url(r'^api/team/$', APITeamListView.as_view(), name='api_team_list'),
    url(r'^api/team/(?P<team_id>\d+)/$', APITeamDetailView.as_view(),
        name='api_team_detail'),
    url(r'^api/team/(?P<team_id>\d+)/membership/$',
        APITeamMembershipListView.as_view(),
        name='api_team_membership_list'),
    url(r'^api/team/(?P<team_id>\d+)/membership/(?P<membership_id>\d+)/$',
        APITeamMembershipDetailView.as_view(),
        name='api_team_membership_detail'),

    # Team management.
    url(r'^team/$', TeamCreateView.as_view(), name='team_create'),
    url(r'^team/(?P<team_id>\d+)/manage$', TeamManagementView.as_view(),
        name='team_manage'),
    url(r'^team/(?P<team_id>\d+)/edit$', TeamEditView.as_view(),
        name='team_edit'),
]
