# models.py (substances)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Models for substances.

Available models:
- Substance
- Ecotox
- HHCF
"""

from django.db import models
from constants.models import TRACI_FLAG_OPTIONS, DEFAULT_TRACI_FLAG

class Substance(models.Model):
    """Substance object contains information related to chemicals and other substances."""
    name = models.CharField(blank=False, null=False, max_length=255)
    cas = models.CharField(blank=False, null=False, max_length=32)
    formatted_cas = models.CharField(blank=False, null=False, max_length=32)
    
    global_warming_air = models.FloatField(blank=False, null=False, default=0)
    acidification_air = models.FloatField(blank=False, null=False, default=0)
    hh_particulate_air = models.FloatField(blank=False, null=False, default=0)
    eutrophication_air = models.FloatField(blank=False, null=False, default=0)
    eutrophication_water = models.FloatField(blank=False, null=False, default=0)
    ozone_depletion_air = models.FloatField(blank=False, null=False, default=0)
    smog_air = models.FloatField(blank=False, null=False, default=0)

    ecotox = models.OneToOneField(Ecotox)
    hhcf = models.OneToOneField(Hhcf)


class Ecotox(models.Model):
    """TODO."""
    #id = models.AutoField(primary_key=True)
    ecotox_airu = models.FloatField(blank=False, null=False, default=0)
    ecotox_airc = models.FloatField(blank=False, null=False, default=0)
    ecotox_waterc = models.FloatField(blank=False, null=False, default=0)
    ecotox_seawaterc = models.FloatField(blank=False, null=False, default=0)
    ecotox_nat_soilc = models.FloatField(blank=False, null=False, default=0)
    ecotox_agr_soilc = models.FloatField(blank=False, null=False, default=0)
    ecotox_flag = models.CharField(max_length=12, choices=TRACI_FLAG_OPTIONS, default=DEFAULT_TRACI_FLAG)


class Hhcf(models.Model):
    """TODO."""
    #id = models.AutoField(primary_key=True)
    hhcf_air_cancer = models.FloatField(blank=False, null=False, default=0)
    hhcf_air_noncanc = models.FloatField(blank=False, null=False, default=0)
    hhcf_freshwater_cancer = models.FloatField(blank=False, null=False, default=0)
    hhcf_freshwater_noncanc = models.FloatField(blank=False, null=False, default=0)
    hhcf_seawater_cancer = models.FloatField(blank=False, null=False, default=0)
    hhcf_seawater_noncanc = models.FloatField(blank=False, null=False, default=0)
    hhcf_natsoil_cancer = models.FloatField(blank=False, null=False, default=0)
    hhcf_natsoil_noncanc = models.FloatField(blank=False, null=False, default=0)
    hhcf_agrsoil_cancer = models.FloatField(blank=False, null=False, default=0)
    hhcf_agrsoil_noncanc = models.FloatField(blank=False, null=False, default=0)
    hhcf_carcinogenic_flag = models.CharField(max_length=12, choices=TRACI_FLAG_OPTIONS, default=DEFAULT_TRACI_FLAG)
    hhcf_noncarcinogenic_flag = models.CharField(max_length=12, choices=TRACI_FLAG_OPTIONS, default=DEFAULT_TRACI_FLAG)


class FossilFuels(models.Model):
    """Contains information related to Fossil Fuel CF (MJ/MJ) for specific Fossil Fuels Consumed."""
    name = models.CharField(blank=False, null=False, max_length=255)
    cf = models.FloatField(blank=False, null=False, default=0)