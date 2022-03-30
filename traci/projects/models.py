# models.py (projects)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
"""
Models for Projects (LCI Data).

Available models:
- None yet
"""

from django.db import models
from constants.models import TRACI_SCOPE_OPTIONS


class Project(models.Model):
    """Project object containing LCI Data."""
    name = models.CharField(null=False, blank=False, max_length=255)
    version = models.CharField(null=True, blank=True, max_length=31)
    organization = models.CharField(blank=True, null=True, max_length=127)
    org_unit = models.CharField(blank=True, null=True, max_length=63)
    contact = models.CharField(blank=True, null=True, max_length=127)
    phone_num = models.CharField(blank=True, null=True, max_length=31)
    scope = models.CharField(blank=True,
                             null=True,
                             max_length=127,
                             choices=TRACI_SCOPE_OPTIONS)
    description = models.CharField(blank=True, null=True, max_length=255)
    functional_unit = models.CharField(blank=True, null=True, max_length=31)
