# serializers.py (chemicals)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Chemical serializers.

Available functions:
- JSON serializer for Chemical list REST api
"""

from rest_framework import serializers
# from rest_framework.exceptions import ValidationError
from chemicals.models import Chemical


class ChemicalSerializer(serializers.ModelSerializer):
    """JSON serializer for Chemical list REST api."""

    class Meta:
        """MetaData related to ChemicalSerializer."""

        model = Chemical
        fields = ('id', 'name', 'cas', 'formatted_cas')
