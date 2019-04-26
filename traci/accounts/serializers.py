# serializers.py (accounts)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Serializer for users and profile information.

Available functions:
- Serialized for users
"""

from django.contrib.auth.models import User
from rest_framework import serializers


class UserSerializer(serializers.ModelSerializer):
    """Serialized for users."""

    class Meta:
        """Add docstring."""  # TODO add docstring.

        model = User
        fields = ('id', 'username', 'first_name', 'last_name', 'email')
