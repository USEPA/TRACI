# manage.py
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
"""
manage.py does the same thing as django-admin.

Additionally puts your project's package on sys.path. It sets the
DJANGO_SETTINGS_MODULE environment variable so that it points to your
project's settings.py file.
"""

import os
from sys import argv

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "traci.settings")
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?") from exc
    execute_from_command_line(argv)
