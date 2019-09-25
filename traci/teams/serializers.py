# serializers.py (teams)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Team serializers.

Available functions:
- JSON serializer for reading team members
- Serializer for create, update, delete
- JSON serializer for Team list REST api
"""


from rest_framework import serializers
from rest_framework.exceptions import ValidationError
from django.utils import timezone
from accounts.serializers import UserSerializer
from teams.models import Team, TeamMembership, User


class TeamMembershipSerializer(serializers.ModelSerializer):
    """JSON serializer for reading team members."""

    member = UserSerializer(many=False)

    class Meta:
        """Meta data related to the Team Membership serializer."""

        model = TeamMembership
        fields = ('id', 'added_date', 'is_owner', 'can_edit', 'member')


class TeamMembershipModifySerializer(serializers.ModelSerializer):
    """Serializer for create, update, delete."""

    team = serializers.PrimaryKeyRelatedField(many=False,
                                              queryset=Team.objects.all())
    member = serializers.PrimaryKeyRelatedField(many=False,
                                                queryset=User.objects.all())
    id = serializers.IntegerField(required=False, read_only=True)
    added_date = serializers.DateTimeField(required=False,
                                           default=serializers.CreateOnlyDefault
                                           (timezone.now))
    is_owner = serializers.BooleanField(required=False,
                                        default=serializers.CreateOnlyDefault(
                                            False))
    can_edit = serializers.BooleanField(required=False,
                                        default=serializers.CreateOnlyDefault(
                                            True))

    def validate(self, data, *args, **kwargs):
        """Make sure we do not already have an owner."""
        if "is_owner" in data and data["is_owner"]:
            current_owner = TeamMembership.objects.filter(team=data["team"],
                                                          is_owner=True).first()
            if current_owner is not None:
                raise ValidationError("teams can only have one owner")
        return data

    class Meta:
        """Meta data related to the Team Membership Modification serializer."""

        model = TeamMembership
        fields = ('id', 'added_date', 'is_owner', 'can_edit', 'member', 'team')


class TeamSerializer(serializers.ModelSerializer):
    """JSON serializer for Team list REST api."""

    id = serializers.IntegerField(required=False, read_only=True)
    created_by = UserSerializer(many=False, required=False,
                                default=serializers.CreateOnlyDefault(
                                    serializers.CurrentUserDefault()))
    created_date = serializers.DateTimeField(required=False,
                                             default=serializers.CreateOnlyDefault(
                                                 timezone.now))
    last_modified_by = UserSerializer(many=False,
                                      default=serializers.CurrentUserDefault())
    last_modified_date = serializers.DateTimeField(required=False,
                                                   default=timezone.now)
    team_memberships = TeamMembershipSerializer(many=True, read_only=True,
                                                required=False)

    class Meta:
        """Meta data related to the Team serializer."""

        model = Team
        fields = ('id', 'name', 'created_date', 'created_by',
                  'last_modified_date', 'last_modified_by', 'team_memberships')
