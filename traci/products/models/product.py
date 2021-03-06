# models/product.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Models for Products (LCI Products).

Available models:
- Media option for an instance of a chemical such as Water, Air, etc.
- Location option for a Process.
- Process is a part of the parent life cycle stage, can contain one or more resource/release chemicals.
- LifeCycleStageName is a stage of the product"s life cycle with one or more processes
- Product is an end product
"""

from django.db import models
from chemicals.models import FossilFuel, Unit
from projects.models import Project


class Product(models.Model):
    """Product object containing LCI information for contained chemicals."""
    name = models.CharField(null=False, blank=False, max_length=255)
    # Parent project
    project = models.ForeignKey(Project, on_delete=models.CASCADE)


class LifeCycleStageName(models.Model):
    """
    Life Cycle Stages, the database entries for this will not change.
    There are six static options.
    """
    name = models.CharField(null=False, blank=False, max_length=63)


class LifeCycleStage(models.Model):
    """
    Life Cycle Stage cross-reference with product, constitutes a single life cycle stage "entry" in a product.
    Each entry can have multiple instances of processes, manufacturing of a chemical for example.
    """
    # One of some pre-approved stage names
    name = models.ForeignKey(LifeCycleStageName, on_delete=models.CASCADE)
    # Parent product
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        """Method stringify life cycle stage entry object, show the name"""
        return self.name.name


class Location(models.Model):
    """Location information for LCI."""
    # select * from products_location order by parent_id desc, geogid desc
    geogid = models.IntegerField(primary_key=True, null=False, blank=False)
    # Name can be something like East of Mississippi or a City/County name.
    name = models.CharField(null=True, blank=True, max_length=63)
    abbreviation = models.CharField(null=True, blank=True, max_length=63)
    ewid = models.IntegerField(null=True, blank=True)
    region_id = models.IntegerField(null=True, blank=True)
    geo_level_id = models.IntegerField(null=True, blank=True)
    # Parent can be either United States (in the case of states or regions)
    # or a State/Region (in the case of Cities or Counties).
    parent = models.ForeignKey("Location", on_delete=models.SET_NULL, null=True, blank=True)


class ProcessName(models.Model):
    """Process information for LCI, Name options."""
    name = models.CharField(null=False, blank=False, max_length=63)


class Process(models.Model):
    """Process information for LCI, instance of a process at a location."""
    # Parent life cycle stage
    lifecyclestage = models.ForeignKey(LifeCycleStage, on_delete=models.CASCADE)
    name = models.ForeignKey("ProcessName", on_delete=models.CASCADE)
    # Location will be a one to many with the Location table, foreign key ref
    location = models.ForeignKey("Location", on_delete=models.CASCADE)
    # Step 3: resource/release (dropdown with static options) - is actually a child of lc_stage


class Media(models.Model):
    """What medium is the chemical in, Air, Water, etc."""
    name = models.CharField(null=False, blank=False, max_length=31)


class SubstanceType(models.Model):
    """Fixed options for Resource/Release"""
    # Name will be Chemical Release, Land Use, Fossil Fuel, or Water Use
    name = models.CharField(null=False, blank=False, max_length=63)
    # Type will be Output or Input
    type = models.CharField(null=False, blank=False, max_length=63)


class SubstanceTypeUnit(models.Model):
    """
    Cross reference for substances and units,
    allows specification of which units can belong to which substances.
    """
    unit = models.ForeignKey(Unit, on_delete=models.CASCADE)
    substance = models.ForeignKey(SubstanceType, on_delete=models.CASCADE)


class LandUse(models.Model):
    """Model containing available land uses."""
    name = models.CharField(null=False, blank=False, max_length=63)


class WaterUse(models.Model):
    """Model containing available water uses."""
    name = models.CharField(null=False, blank=False, max_length=63)


# All other substance types, land use, water use, fossil fuels
class Resource(models.Model):
    """Information for resources (inputs)."""
    substance_type = models.ForeignKey(SubstanceType, on_delete=models.CASCADE)
    # Depending on the substance type, one of the three options will be populated:
    fossil_fuel = models.ForeignKey(FossilFuel, null=True, on_delete=models.SET_NULL)
    water_use = models.ForeignKey(WaterUse, null=True, on_delete=models.SET_NULL)
    land_use = models.ForeignKey(LandUse, null=True, on_delete=models.SET_NULL)
    resource_media = models.ForeignKey("Media", on_delete=models.SET_NULL, blank=True, null=True)
    resource_quantity = models.FloatField(blank=True, null=True, default=0)
    resource_unit = models.ForeignKey(Unit, on_delete=models.CASCADE)
    # Parent process reference
    process = models.ForeignKey("Process", on_delete=models.CASCADE)
