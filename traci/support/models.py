# models.py (support)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
"""
Models related to support functions.

Available functions:
- Class describing information requests.
"""

from django.contrib.auth.models import User
from django.db import models
from constants.models import YN_CHOICES

# https://stackoverflow.com/questions/38443628/import-error-cannot-import-name-get-model


def get_support_storage_path(instance, filename):
    """
    Get the 'support' file path given a user and filename.

    :param instance: an object that contains the user information
    :param filename: a string representing the filename
    :return: a string representing a file path
    """
    return '%s/support/%s' % (instance.user.username, filename)


def get_instruction_storage_path(instance, filename):
    """
    Get the 'instructions' file path given a user and filename.

    :param instance: an object that contains the user information
    :param filename: a string representing the filename
    :return: a string representing a file path
    """
    return '%s/instructions/%s' % (instance.user.username, filename)


class SupportType(models.Model):
    """TODO Add docstring."""

    created = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    modified = models.DateTimeField(auto_now=True, null=True, blank=True)
    created_by = models.CharField(blank=True, null=True, max_length=255)
    last_modified_by = models.CharField(blank=True, null=True, max_length=255)

    user = models.ForeignKey(User,
                             null=True,
                             blank=True,
                             on_delete=models.SET_NULL)

    name = models.CharField(blank=True, null=True, max_length=255)

    the_description = models.TextField(null=True, blank=True)

    weblink = models.CharField(blank=True, null=True, max_length=255)
    ordering = models.DecimalField(null=True,
                                   blank=True,
                                   max_digits=10,
                                   decimal_places=1)

    class Meta:
        """TODO Add docstring."""

        ordering = [
            "ordering",
        ]

    def __str__(self):
        """TODO Add docstring."""
        return self.name


class Priority(models.Model):
    """TODO Add docstring."""

    created = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    modified = models.DateTimeField(auto_now=True, null=True, blank=True)
    created_by = models.CharField(blank=True, null=True, max_length=255)
    last_modified_by = models.CharField(blank=True, null=True, max_length=255)

    user = models.ForeignKey(User,
                             null=True,
                             blank=True,
                             on_delete=models.SET_NULL)

    name = models.CharField(blank=True, null=True, max_length=255)

    the_description = models.TextField(null=True, blank=True)

    weblink = models.CharField(blank=True, null=True, max_length=255)
    ordering = models.DecimalField(null=True,
                                   blank=True,
                                   max_digits=10,
                                   decimal_places=1)

    class Meta:
        """TODO Add docstring."""

        ordering = [
            "ordering",
        ]

    def __str__(self):
        """TODO Add docstring."""
        return self.name


class Support(models.Model):
    """TODO Add docstring."""

    created = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    modified = models.DateTimeField(auto_now=True, null=True, blank=True)
    created_by = models.CharField(blank=True, null=True, max_length=255)
    last_modified_by = models.CharField(blank=True, null=True, max_length=255)
    make_public = models.CharField(blank=True,
                                   null=True,
                                   max_length=5,
                                   choices=YN_CHOICES)
    share_with_user_group = models.CharField(blank=True,
                                             null=True,
                                             max_length=5,
                                             choices=YN_CHOICES)

    attachment = models.FileField(null=True,
                                  blank=True,
                                  upload_to=get_support_storage_path)

    user = models.ForeignKey(User,
                             null=True,
                             blank=True,
                             on_delete=models.SET_NULL)
    support_type = models.ForeignKey(SupportType,
                                     null=True,
                                     blank=True,
                                     on_delete=models.SET_NULL)
    priority = models.ForeignKey(Priority,
                                 null=True,
                                 blank=True,
                                 on_delete=models.SET_NULL)

    name = models.CharField(blank=True, null=True, max_length=255)
    subject = models.CharField(blank=True, null=True, max_length=255)
    length_of_reference = models.CharField(blank=True,
                                           null=True,
                                           max_length=255)
    author = models.CharField(blank=True, null=True, max_length=255)

    is_closed = models.CharField(blank=True,
                                 null=True,
                                 max_length=5,
                                 choices=YN_CHOICES)

    the_description = models.TextField(null=True, blank=True)
    resolution = models.TextField(null=True, blank=True)

    weblink = models.CharField(blank=True, null=True, max_length=255)
    ordering = models.DecimalField(null=True,
                                   blank=True,
                                   max_digits=10,
                                   decimal_places=1)
    date_resolved = models.DateField(blank=True, null=True)

    class Meta:
        """TODO Add docstring."""

        ordering = [
            "ordering",
        ]

    def __str__(self):
        """TODO Add docstring."""
        return self.name


class InformationRequest(models.Model):
    """Class describing information requests."""

    created_date = models.DateTimeField(auto_now_add=True, blank=False)
    # email to which the request was forwarded upon submission,
    # typically traci@epa.gov
    sent_to_email = models.CharField(null=True, blank=True, max_length=255)
    # contact info for the person submitting the request
    requestor_first_name = models.CharField(max_length=255, blank=True)
    requestor_last_name = models.CharField(max_length=255, blank=True)
    requestor_email_address = models.EmailField(blank=False, max_length=255)
    # request details
    request_subject = models.CharField(max_length=255, blank=False)
    request_details = models.TextField(blank=False)
    # response from
    response = models.TextField(null=True, blank=True)
    response_date = models.DateField(null=True, blank=True)
