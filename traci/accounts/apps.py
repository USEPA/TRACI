# apps.py (accounts)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Application configuration objects store metadata for an application.

Some attributes can be configured in AppConfig subclasses. Others are set by
Django and read-only. This file is created to include any application
configuration for the app. Using this, you can configure some of the attributes
of the application.

Available functions:
It is the recommended best practice to place your application configuration
in the apps.py.
"""

# Note: DOCUMENTING MODULES. (Top-level file info and docstring): all .py
# files to include the header above (modified for each docstring as
# appropriate) example: lines# 1 thru 18. Reference: Slatkin, Brett,
# "Effective Python, 59 Specific Ways to Write Better Python," Addison-
# Wesley: New York, 2015. ISBN-13: 978-0-13-403428-7. p. 17.

# Python Version Installed to check python version against requirements.txt
import sys
from django.apps import AppConfig
print(sys.version)


class AccountsConfig(AppConfig):
    """Accounts configuration."""

    name = 'accounts'
    verbose_name = "accounts"
    default_app_config = 'accounts.apps.AccountsConfig'
