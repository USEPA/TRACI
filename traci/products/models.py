# models.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Models for Products (LCI Products).

Available models:
- Media option for an instance of a substance such as Water, Air, etc.
- Location option for a Process.
- ResourceRelease a collection of resource/release (substances) for a Process.
- Process is a part of the parent life cycle stage, can contain one or more resource/release substances.
- LifeCycleStageName is a stage of the product's life cycle with one or more processes
- Product is an end product
"""

from django.db import models
from projects.models import Project
from substances.models import Substance


class Media(models.Model):
    """What medium is the substance in, Air, Water, etc."""
    name = models.CharField(null=False, blank=False, max_length=31)


class Location(models.Model):
    """Location information for LCI."""
    geogid = models.IntegerField(primary_key=True, null=False, blank=False)
    # Name can be something like East of Mississippi or a City/County name.
    name = models.CharField(null=True, blank=True, max_length=63)
    abbreviation = models.CharField(null=True, blank=True, max_length=63)
    ewid = models.IntegerField(null=True, blank=True)
    region_id = models.IntegerField(null=True, blank=True)
    geo_level_id = models.IntegerField(null=True, blank=True)
    # Parent can be either United States (in the case of East of Mississippi)
    # or a State name (in the case of City/County).
    parent = models.ForeignKey('Location', on_delete=models.SET_NULL, null=True, blank=True)


class ResourceReleaseType(models.Model):
    """Fixed options for Resource/Release"""
    # Name will be Chemical Release, Land Use, Fossil Fuel, or Water Use
    name = models.CharField(null=False, blank=False, max_length=63)
    # Type will be Output or Input
    type = models.CharField(null=False, blank=False, max_length=63)


class ResourceRelease(models.Model):
    """
    Information for a Resource (input) or Chemical Release (output).
    """
    # Parent process reference
    process = models.ForeignKey('Process', on_delete=models.CASCADE)
    # ResourceReleaseType, Chemical Release, Land Use, Fossil Fuel, or Water Use
    type = models.ForeignKey('ResourceReleaseType', on_delete=models.CASCADE)
    # Substance/chemical
    substance = models.ForeignKey(Substance, on_delete=models.CASCADE)
    quantity = models.FloatField(blank=True, null=True, default=0)
    unit = models.CharField(blank=True, null=True, default='', max_length=15)
    # Media through which the Releases are output, null if Resource/Input.
    media = models.ForeignKey('Media', on_delete=models.SET_NULL, blank=True, null=True)


class ProcessName(models.Model):
    """Process information for LCI, Name options."""
    name = models.CharField(null=False, blank=False, max_length=63)


class Process(models.Model):
    """Process information for LCI, instance of a process at a location."""
    name = models.ForeignKey('ProcessName', on_delete=models.CASCADE)
    # Location will be a one to many with the Location table, foreign key ref
    location = models.ForeignKey('Location', on_delete=models.CASCADE)
    # Step 3: resource/release (dropdown with static options) - is actually a child of lc_stage


class LifeCycleStageName(models.Model):
    """
    Life Cycle Stages, the database entries for this will not change.
    There are six static options.
    """
    name = models.CharField(null=False, blank=False, max_length=63)


class Product(models.Model):
    """Product object containing LCI information for contained substances."""
    name = models.CharField(null=False, blank=False, max_length=255)
    # Parent project
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    # Step 1: Life Cycle Stage (multiselect options) Many to Many relationship with LifeCycleStageName table
    # Step 2: Processes
    # Step 3: resource/releases


class LifeCycleStage(models.Model):
    """
    Life Cycle Stage cross-reference with product, constitutes a single life cycle stage "entry" in a product.
    Each entry can have multiple instances of processes, manufacturing of a substance for example.
    """
    # One of some pre-approved stage names
    name = models.ForeignKey(LifeCycleStageName, on_delete=models.CASCADE)
    # Parent product
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        """Method stringify life cycle stage entry object, show the name"""
        return self.name.name
