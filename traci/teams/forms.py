# forms.py (teams)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Forms for managing teams.

Available functions:
- Form For Creating or Updating a Project
"""

from django import forms
from django.utils.translation import ugettext_lazy as _
from teams.models import Team


class TeamManagementForm(forms.ModelForm):
    """Form For Creating or Updating a Project."""

    # name of the project
    name = forms.CharField(label=_("Name"),
                           help_text="Project names must be unique",
                           widget=forms.TextInput(
                               attrs={'class': 'form-control'}), required=True)

    class Meta:
        """Add docstring."""  # TODO add docstring.

        model = Team
        fields = ("name",)
