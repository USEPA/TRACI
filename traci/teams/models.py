# models.py (teams)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Models for teams of users.

Available functions:
- Team object allows groups of users to share projects
- Object describing user's membership on a project team
"""

from django.contrib.auth.models import User
from django.db import models


# Create your models here.
class Team(models.Model):
    """Team object allows groups of users to share projects."""

    # when and by whom the team was created
    created_date = models.DateTimeField(auto_now_add=True, null=True,
                                        blank=True, editable=False)
    created_by = models.ForeignKey(User, blank=True, editable=False,
                                   related_name="team_created_by",
                                   on_delete=models.CASCADE)
    # when and by whom the team was last modified
    last_modified_date = models.DateTimeField(auto_now=True, blank=False)
    last_modified_by = models.ForeignKey(User, null=True, blank=True,
                                         related_name="team_last_modified_by",
                                         on_delete=models.CASCADE)
    # name of the team
    name = models.CharField(blank=False, max_length=255, db_index=True)
    # list of members
    members = models.ManyToManyField(User, through="TeamMembership")


class TeamMembership(models.Model):
    """Object describing user's membership on a project team."""

    added_date = models.DateTimeField(auto_now_add=True, blank=False,
                                      editable=False)
    # the user
    member = models.ForeignKey(User, blank=False,
                               related_name="member_memberships",
                               on_delete=models.CASCADE)
    # the team
    team = models.ForeignKey(Team, blank=False,
                             related_name="team_memberships",
                             on_delete=models.CASCADE)
    # indicates if the user is a group owner
    is_owner = models.BooleanField(blank=False)
    # indicates if the user can edit projects in the group
    can_edit = models.BooleanField(blank=False)
