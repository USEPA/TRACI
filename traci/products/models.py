# models.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Models for Products (LCI Products).

Available models:
- Media option for an instance of a substance such as Water, Air, etc.
- Location option for a Process.
- ResourceReleaseOption
- SubstanceEntry for an instance of a substance, this model contains quantity, units, etc.
- ResourceRelease a collection of resource/release (substances) for a Process.
- Process is a part of the parent life cycle stage, can contain one or more resource/release substances.
- LifeCycleStage is a stage of the product's life cycle with one or more processes
- Product is an end product
"""

from django.db import models
from substances.models import Substance


class Media(models.Model):
    """What medium is the substance in, Air, Water, etc."""
    name = models.CharField(null=False, blank=False, max_length=31)


class Location(models.Model):
    """Location information for LCI."""
    # Name can be something like East of Mississippi or a City/County name.
    name = models.CharField(null=False, blank=False, max_length=63)
    # Parent can be either United States (in the case of East of Mississippi)
    # or a State name (in the case of City/County).
    parent = models.CharField(null=False, blank=False, max_length=63)


class ResourceReleaseOption(models.Model):
    """
    Static options for the ResourceRelease dropdown,
    can be CHEMICAL RELEASE, LAND USE, FOSSIL FUEL, WATER USE.
    """
    name = models.CharField(null=False, blank=False, max_length=255)


class SubstanceEntry(models.Model):
    """Instance of substance with quanity, unit, and media."""
    substance = models.ForeignKey(Substance, on_delete=models.CASCADE)
    quantity = models.FloatField(blank=True, null=True, default=0)
    unit = models.CharField(blank=True, null=True, default='', max_length=15)
    media = models.ForeignKey('Media', on_delete=models.CASCADE)


class ResourceRelease(models.Model):
    """
    Information for Resource or Release pertaining to the Product Details.
    Acceptable dropdowns are CHEMICAL RELEASE, LAND USE, FOSSIL FUEL, WATER USE.
    Then you can add multiple substances under the selected Resource or Release (dropdown).
    The substances will be a many-to-many relationship.
    """
    name = models.ForeignKey('ResourceReleaseOption', on_delete=models.CASCADE)
    substances = models.ManyToManyField('SubstanceEntry')


# class ProcessOption(models.Model):
#     """
#     Static options for the Process name dropdown.
#     Options are: Paper use, Platemaking, Platemaking manufacturing, Plating,
#     Printing, Recycling, Transportation, Washing. However, these are likely configurable.
#     """
#     name = models.CharField(null=False, blank=False, max_length=255)



# TODO: In the desktop application, this is a dropdown. Should we make it simply a name field in Process?
# There are some more detailed options under the process name, such as data entry by, data source, etc.
class Process(models.Model):
    """Process information for LCI."""
    name = models.CharField(null=False, blank=False, max_length=63)
    # Location will be a one to many with the Location table, foreign key ref
    location = models.ForeignKey('Location', on_delete=models.CASCADE)
    # Step 3: resource/release (dropdown with static options) - is actually a child of lc_stage
    resource_release = models.ForeignKey('ResourceRelease', on_delete=models.CASCADE)


class LifeCycleStage(models.Model):
    """
    Life Cycle Stages, the database entries for this will not change.
    There are six static options.
    """
    name = models.CharField(null=False, blank=False, max_length=63)
    # Step 2: Process
    processes = models.ManyToManyField('Process')


class Product(models.Model):
    """Product object containing LCI information for contained substances."""
    name = models.CharField(null=False, blank=False, max_length=255)
    # Step 1: Life Cycle Stage (multiselect options) Many to Many relationship with LifeCycleStage table
    stages = models.ManyToManyField('LifeCycleStage')
    # Step 2: Process - is actually a child of lc_stage
    # process = models.ForeignKey('Process', on_delete=models.CASCADE)
    # Step 3: resource/release (dropdown with static options) - is actually a child of lc_stage
    # resource_release = models.ForeignKey('ResourceRelease', on_delete=models.CASCADE)


