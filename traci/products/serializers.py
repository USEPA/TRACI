# serializers.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Chemical serializers.

Available functions:
- A basic Serializer for Release objects
"""

from rest_framework import serializers
from products.models import Release

class ReleaseSerializer(serializers.ModelSerializer):
    """A basic Serializer for Release objects."""
    class Meta:
        model = Release
        fields = "__all__"
