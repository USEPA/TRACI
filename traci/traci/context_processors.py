# pylint: skip-file
# context_processors.py (traci)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
"""
This file contains software infomation.

Available functions:
- Returns the app name, version, and EPA disclaimers
"""

from django.conf import settings


def software_info(request):
    """Return the app name, version, and disclaimer."""
    return {
        'APP_VERSION': settings.APP_VERSION,
        'APP_NAME': settings.APP_NAME,
        'APP_NAME_SHORT': settings.APP_NAME_SHORT,
        'APP_NAME_LONG': settings.APP_NAME_LONG,
        'APP_DESCRIPTION': settings.APP_DESCRIPTION,
        'APP_DISCLAIMER': settings.APP_DISCLAIMER,
        'APP_ENDORSEMENT': settings.APP_ENDORSEMENT
    }
