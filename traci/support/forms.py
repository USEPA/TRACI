# forms.py (support)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
"""
Form used to manage support.

Available functions:
- Form For Creating a Support Issue.
- Form For Responding To a Support Issue.
- Form For listing Support type requested.
- Form for creating an information request.
"""

from django import forms
from django.db import models
from django.utils.translation import gettext_lazy as _
from traci.settings import DEFAULT_FROM_EMAIL
from constants.models import YN_CHOICES
from support.models import SupportType, Support, Priority, InformationRequest


class SupportForm(forms.ModelForm):
    """A Form For Creating a Support Issue."""

    def __init__(self, *args, **kwargs):
        """TODO Add docstring."""
        super(SupportForm, self).__init__(*args, **kwargs)

    name = forms.CharField(
        label=_("Issue"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=False)
    subject = forms.CharField(
        label=_("Subject"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=False)
    support_type = forms.ModelChoiceField(
        label=_("Type of Inquiry"),
        queryset=SupportType.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control'}),
        required=False)

    the_description = forms.CharField(
        label=_("Problem Description"),
        widget=forms.Textarea(attrs={'class': 'form-control'}),
        required=False)
    weblink = forms.CharField(
        label=_("Email Address"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=False,
        help_text="Please Submit Your Return Email Address")

    class Meta:
        """Add docstring."""

        model = Support
        fields = (
            "name",
            "subject",
            "support_type",
            "the_description",
            "weblink",
        )


class SupportAdminForm(forms.ModelForm):
    """A Form For Responding To a Support Issue."""

    def __init__(self, *args, **kwargs):
        """TODO Add docstring."""
        super(SupportAdminForm, self).__init__(*args, **kwargs)

    name = forms.CharField(
        label=_("Issue"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=False)
    subject = forms.CharField(
        label=_("Subject"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=False)
    support_type = forms.ModelChoiceField(
        label=_("Type of Support"),
        queryset=SupportType.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control'}),
        required=False)
    resolution = forms.CharField(
        label=_("Resolution"),
        widget=forms.Textarea(attrs={'class': 'form-control'}),
        required=False)
    is_closed = forms.ChoiceField(
        label=_("Closed ?"),
        choices=YN_CHOICES,
        widget=forms.Select(attrs={'class': 'form-control'}),
        required=False)

    date_resolved = forms.DateField(
        label=_("Date Resolved"),
        widget=forms.SelectDateWidget(attrs={'class': 'form-control'}),
        required=False)

    the_description = forms.CharField(
        label=_("Problem Description"),
        widget=forms.Textarea(attrs={'class': 'form-control'}),
        required=False)
    weblink = forms.CharField(
        label=_("Website Reference"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=False)

    class Meta:
        """Add docstring."""

        model = Support
        fields = (
            "name",
            "subject",
            "support_type",
            "the_description",
            "weblink",
            "resolution",
            "is_closed",
            "date_resolved",
        )


class SupportTypeForm(forms.ModelForm):
    """Form For listing Support type requested."""

    def __init__(self, *args, **kwargs):
        """TODO Add docstring."""
        super(SupportTypeForm, self).__init__(*args, **kwargs)

    name = forms.CharField(
        label=_("Support Type"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=False)

    class Meta:
        """Add docstring."""

        model = SupportType
        fields = ("name", )


class PriorityForm(forms.ModelForm):
    """A Form For Creating a Support Issue."""

    def __init__(self, *args, **kwargs):
        """TODO Add docstring."""
        super(PriorityForm, self).__init__(*args, **kwargs)

    name = forms.CharField(
        label=_("Priority"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=False)

    class Meta:
        """TODO Add docstring."""

        model = Priority
        fields = ("name", )


class InformationRequestForm(forms.ModelForm):
    """Form for creating an information request."""

    created_date = models.DateTimeField(auto_now_add=True, blank=False)
    # email to which the request was forwarded upon submission,
    # typically traci@epa.gov
    sent_to_email = DEFAULT_FROM_EMAIL
    # contact info for the person submitting the request
    requestor_first_name = forms.CharField(
        label=_("First"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=True,
        max_length=255)
    requestor_last_name = forms.CharField(
        label=_("Last"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=True,
        max_length=255)
    requestor_email_address = forms.CharField(
        label=_("Return Email Address"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=True,
        max_length=255)
    # request details
    request_subject = forms.CharField(
        label=_("Subject"),
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=True,
        max_length=255)
    request_details = forms.CharField(
        label=_("Details"),
        widget=forms.Textarea(attrs={'class': 'form-control'}),
        required=True,
        max_length=255)

    class Meta:
        """TODO Add docstring."""

        model = InformationRequest
        fields = ("requestor_first_name", "requestor_last_name",
                  "requestor_email_address", "request_subject",
                  "request_details")
