# models.py (chemicals)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Models for chemicals.

Available models:
- Chemical
- Ecotox
- HHCF
- FossilFuel
"""

from django.db import models
from constants.models import TRACI_FLAG_OPTIONS, DEFAULT_TRACI_FLAG


class Unit(models.Model):
    """Available units for measuring resources and releases (inputs and outputs)"""

    name = models.CharField(blank=False, null=False, max_length=63)
    description = models.CharField(blank=True, null=True, max_length=255)
    chemical = models.BooleanField(blank=False, null=False, default=False)
    land_use = models.BooleanField(blank=False, null=False, default=False)
    water_use = models.BooleanField(blank=False, null=False, default=False)
    fossil_fuel = models.BooleanField(blank=False, null=False, default=False)


class Ecotox(models.Model):
    """Information related to a chemical's ecotoxicity potential."""

    ecotox_airu = models.FloatField(blank=True, null=True, default=0)
    ecotox_airc = models.FloatField(blank=True, null=True, default=0)
    ecotox_waterc = models.FloatField(blank=True, null=True, default=0)
    ecotox_seawaterc = models.FloatField(blank=True, null=True, default=0)
    ecotox_nat_soilc = models.FloatField(blank=True, null=True, default=0)
    ecotox_agr_soilc = models.FloatField(blank=True, null=True, default=0)
    ecotox_flag = models.CharField(max_length=12,
                                   choices=TRACI_FLAG_OPTIONS,
                                   default=DEFAULT_TRACI_FLAG)


class FossilFuel(models.Model):
    """Info link Fossil Fuel CF (MJ/MJ) for specific Fossil Fuels Consumed."""

    name = models.CharField(blank=False, null=False, max_length=255)
    cf = models.FloatField(blank=False, null=False, default=0)


class Hhcf(models.Model):
    """Info related to a chemical's Human Health Characterization Factor."""

    hhcf_urban_air_cancer = models.FloatField(blank=True, null=True, default=0)
    hhcf_urban_air_noncanc = models.FloatField(blank=True, null=True, default=0)
    hhcf_rural_air_cancer = models.FloatField(blank=True, null=True, default=0)
    hhcf_rural_air_noncanc = models.FloatField(blank=True, null=True, default=0)
    hhcf_freshwater_cancer = models.FloatField(blank=True, null=True, default=0)
    hhcf_freshwater_noncanc = models.FloatField(blank=True, null=True, default=0)
    hhcf_seawater_cancer = models.FloatField(blank=True, null=True, default=0)
    hhcf_seawater_noncanc = models.FloatField(blank=True, null=True, default=0)
    hhcf_natsoil_cancer = models.FloatField(blank=True, null=True, default=0)
    hhcf_natsoil_noncanc = models.FloatField(blank=True, null=True, default=0)
    hhcf_agrsoil_cancer = models.FloatField(blank=True, null=True, default=0)
    hhcf_agrsoil_noncanc = models.FloatField(blank=True, null=True, default=0)
    hhcf_carcinogenic_flag = models.CharField(max_length=12,
                                              choices=TRACI_FLAG_OPTIONS,
                                              default=DEFAULT_TRACI_FLAG)
    hhcf_noncarcinogenic_flag = models.CharField(max_length=12,
                                                 choices=TRACI_FLAG_OPTIONS,
                                                 default=DEFAULT_TRACI_FLAG)


class Chemical(models.Model):
    """Chemical object contains information related to chemicals and other chemicals."""

    name = models.CharField(blank=False, null=False, max_length=255)
    cas = models.CharField(blank=False, null=False, max_length=32)
    formatted_cas = models.CharField(blank=False, null=False, max_length=32)

    global_warming_air = models.FloatField(blank=True, null=True, default=0)
    acidification_air = models.FloatField(blank=True, null=True, default=0)
    hh_particulate_air = models.FloatField(blank=True, null=True, default=0)
    eutrophication_air = models.FloatField(blank=True, null=True, default=0)
    eutrophication_water = models.FloatField(blank=True, null=True, default=0)
    ozone_depletion_air = models.FloatField(blank=True, null=True, default=0)
    smog_air = models.FloatField(blank=True, null=True, default=0)

    ecotox = models.OneToOneField(Ecotox, on_delete=models.CASCADE)
    hhcf = models.OneToOneField(Hhcf, on_delete=models.CASCADE)
