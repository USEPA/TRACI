# serializers.py (substances)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Substance serializers.

Available functions:
- JSON serializer for Substance list REST api
"""

from rest_framework import serializers
# from rest_framework.exceptions import ValidationError
from substances.models import Substance


class SubstanceSerializer(serializers.ModelSerializer):
    """JSON serializer for Substance list REST api."""

    class Meta:
        """MetaData related to SubstanceSerializer."""

        model = Substance
        fields = ('id', 'name', 'cas', 'formatted_cas')
