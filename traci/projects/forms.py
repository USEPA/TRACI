# forms.py (projects)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of forms."""

from django.forms import ModelForm, CharField, FloatField, TextInput, Textarea, ChoiceField, Select
from django.utils.translation import ugettext_lazy as _
from constants.models import TRACI_SCOPE_OPTIONS
from projects.models import Project


# New Project Form
class ProjectForm(ModelForm):
    """
    Base form for creating a new project.
    """
    # All strings except scope, which is a dropdown with choices. Still a string, but w/ choices.
    # Project Name
    name = CharField(
        max_length=255,
        widget=TextInput({'class': 'form-control mb-2', 'placeholder': 'Project Name'}),
        label=_("Project Name"), required=True)
    # Version
    version = CharField(
        max_length=31,
        widget=TextInput({'class': 'form-control mb-2', 'placeholder': '1.0.0.0'}),
        label=_("Project Version"), required=True)
    # Organization
    organization = CharField(
        max_length=127,
        widget=TextInput({'class': 'form-control mb-2', 'placeholder': 'Organization'}),
        label=_("Organization"), required=True)
    # Organizational Unit
    org_unit = CharField(
        max_length=63,
        widget=TextInput({'class': 'form-control mb-2', 'placeholder': 'Organizational Unit'}),
        label=_("Organizational Unit"), required=True)
    # point of contact
    contact = CharField(
        max_length=127,
        widget=TextInput({'class': 'form-control mb-2', 'placeholder': 'Point of Contact'}),
        label=_("Point of Contact"), required=True)
    # phone
    phone_num = CharField(
        max_length=31,
        widget=TextInput({'class': 'form-control mb-2', 'placeholder': '(###) ###-####'}),
        label=_("Phone Number"), required=True)
    # scope - dropdown
    # TODO: CHOICES
    scope = ChoiceField(
        choices=TRACI_SCOPE_OPTIONS,
        widget=Select({'class': 'form-control mb-2',}),
        label=_("Scope"), required=True)
    # description
    description = CharField(
        max_length=255,
        widget=Textarea({'rows': 2, 'class': 'form-control mb-2', 'placeholder': 'Description'}),
        label=_("Project Description"), required=True)
    # functional unit
    functional_unit = CharField(
        max_length=31,
        widget=Textarea({'rows': 1, 'class': 'form-control mb-2', 'placeholder': 'Unit'}),
        label=_("Functional Unit"), required=True)

    class Meta:
        """Meta data for Project form."""

        model = Project
        fields = ('name', 'version', 'organization', 'org_unit', 'contact',
                  'phone_num', 'scope', 'description', 'functional_unit')
