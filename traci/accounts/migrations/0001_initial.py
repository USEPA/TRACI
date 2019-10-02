"""
This file is the initial migration file for the accounts project
"""

# 0001_initial.py (accounts)
# !/usr/bin/env python
# coding=utf-8
# young.daniel@epa.gov
# pylint: disable=invalid-name

from __future__ import unicode_literals
from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):
    """
    Migrate user settings.
    """

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False,
                                        auto_created=True, primary_key=True)),
                ('country', models.CharField(max_length=255, null=True, blank=True)),
                ('abbreviation', models.CharField(max_length=4)),
                ('flag', models.CharField(max_length=255, null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Role',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False,
                                        auto_created=True, primary_key=True)),
                ('role', models.CharField(max_length=255, null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Sector',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False,
                                        auto_created=True, primary_key=True)),
                ('sector', models.CharField(max_length=255, null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='State',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False,
                                        auto_created=True, primary_key=True)),
                ('state', models.CharField(max_length=255)),
                ('abbreviation', models.CharField(max_length=4)),
                ('country', models.ForeignKey(to='accounts.Country', on_delete=models.CASCADE)),
            ],
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False,
                                        auto_created=True, primary_key=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('last_modified', models.DateTimeField(auto_now=True)),
                ('affiliation', models.CharField(max_length=255, null=True, blank=True)),
                ('job_title', models.CharField(max_length=255, null=True, blank=True)),
                ('address_line1', models.CharField(max_length=255, null=True, blank=True)),
                ('address_line2', models.CharField(max_length=255, null=True, blank=True)),
                ('city', models.CharField(max_length=255, null=True, blank=True)),
                ('zipcode', models.CharField(max_length=255, null=True, blank=True)),
                ('country', models.ForeignKey(blank=True, to='accounts.Country', null=True, on_delete=models.CASCADE)),
                ('role', models.ForeignKey(blank=True, to='accounts.Role', null=True, on_delete=models.CASCADE)),
                ('sector', models.ForeignKey(blank=True, to='accounts.Sector', null=True, on_delete=models.CASCADE)),
                ('state', models.ForeignKey(blank=True, to='accounts.State', null=True, on_delete=models.CASCADE)),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL, on_delete=models.CASCADE)),
            ],
        ),
    ]
