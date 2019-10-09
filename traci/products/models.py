# models.py (products)
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
from chemicals.models import Chemical, Unit
from chemicals.util import ConversionFactors
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


# All other substance types, land use, water use, fossil fuels
class Resource(models.Model):
    """Information for resources (inputs)."""
    substance_type = models.ForeignKey(SubstanceType, on_delete=models.CASCADE)
    resource_media = models.ForeignKey("Media", on_delete=models.SET_NULL, blank=True, null=True)
    resource_quantity = models.FloatField(blank=True, null=True, default=0)
    resource_unit = models.ForeignKey(Unit, on_delete=models.CASCADE)
    # Parent process reference
    process = models.ForeignKey("Process", on_delete=models.CASCADE)



# Substance type "Chemical Release"
class Release(models.Model):
    """Information for a Chemical Release (output)."""
    # Chemical/chemical
    chemical = models.ForeignKey(Chemical, on_delete=models.CASCADE)
    release_quantity = models.FloatField(blank=True, null=True, default=0)
    release_unit = models.ForeignKey(Unit, on_delete=models.CASCADE)
    # Media through which the Releases are output, null if Resource/Input.
    release_media = models.ForeignKey("Media", on_delete=models.SET_NULL, blank=True, null=True)
    # Parent process reference
    process = models.ForeignKey("Process", on_delete=models.CASCADE)
    
    # ReleaseImpactFactor is the data from Excel tool, now stored in the following Chemical tables:
    # chemicals_chemical, chemicals_ecotox, chemicals_fossilfuel, chemicals_hhcf, chemicals_unit

    def Factor(self, emission):
        try:
            float(emission) * self.release_quantity * ConversionFactors.ReleaseFactor(self.release_unit)
        except ValueError:
            return 0


    def GlobalWarmingPotential(self):
        """Calculate the GlobalWarmingPotential for this chemical release."""
        return self.Factor(self.chemical.global_warming_air)

    def Acidification(self):
        """Calculate the Acidification for this chemical release."""
        return self.Factor(self.chemical.acidification_air)

    def HumanHealthCriteria(self):
        """Calculate the HumanHealthCriteria for this chemical release."""
        return self.Factor(self.chemical.hh_particulate_air)

    def EutrophicationAir(self):
        """Calculate the EutrophicationAir for this chemical release."""
        return self.Factor(self.chemical.eutrophication_air)

    def EutrophicationWater(self):
        """Calculate the EutrophicationWater for this chemical release."""
        return self.Factor(self.chemical.eutrophication_water)

    def OzoneDepletion(self):
        """Calculate the OzoneDepletion for this chemical release."""
        return self.Factor(self.chemical.ozone_depletion_air)

    def SmogAir(self):
        """Calculate the SmogAir for this chemical release."""
        return self.Factor(self.chemical.smog_air)

    # Ecotox section
    # The functions in VB program don"t match the data from the Excel sheet (which is in the PSQL DB).
    # Therefore, we will be focusing on the data in the Excel Sheet/PSQL DB.
    def EcotoxAirU(self):
        """Calculate the EcotoxAirU for this chemical release."""
        return self.Factor(self.chemical.ecotox.ecotox_airu)
    
    def EcotoxAirC(self):
        """Calculate the EcotoxAirC for this chemical release."""
        return self.Factor(self.chemical.ecotox.ecotox_airc)
    
    def EcotoxWaterC(self):
        """Calculate the EcotoxWaterC for this chemical release."""
        return self.Factor(self.chemical.ecotox.ecotox_waterc)
    
    def EcotoxSeaWaterC(self):
        """Calculate the EcotoxSeaWaterC for this chemical release."""
        return self.Factor(self.chemical.ecotox.ecotox_seawaterc)
    
    def EcotoxNatSoilC(self):
        """Calculate the EcotoxNatSoilC for this chemical release."""
        return self.Factor(self.chemical.ecotox.ecotox_nat_soilc)
    
    def EcotoxAgrSoilC(self):
        """Calculate the EcotoxAgrSoilC for this chemical release."""
        return self.Factor(self.chemical.ecotox.ecotox_agr_soilc)

    # Human Health section
    # The functions in VB program don"t match the data from the Excel sheet (which is in the PSQL DB).
    # Therefore, we will be focusing on the data in the Excel Sheet/PSQL DB.
    def HumanHealthCancer(self):
        """Calculate the HumanHealthCancer for this chemical release, summing all the cancers."""
        return self.Factor(self.chemical.hhcf.hhcf_urban_air_cancer) + \
            self.Factor(self.chemical.hhcf.hhcf_rural_air_cancer) + \
            self.Factor(self.chemical.hhcf.hhcf_freshwater_cancer) + \
            self.Factor(self.chemical.hhcf.hhcf_seawater_cancer) + \
            self.Factor(self.chemical.hhcf.hhcf_natsoil_cancer) + \
            self.Factor(self.chemical.hhcf.hhcf_agrsoil_cancer)

    def HumanHealthUrbanAirCancer(self):
        """Calculate the HumanHealthUrbanAirCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_urban_air_cancer)

    def HumanHealthRuralAirCancer(self):
        """Calculate the HumanHealthRuralAirCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_rural_air_cancer)

    def HumanHealthFreshwaterCancer(self):
        """Calculate the HumanHealthFreshwaterCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_freshwater_cancer)

    def HumanHealthSeawaterCancer(self):
        """Calculate the HumanHealthSeawaterCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_seawater_cancer)

    def HumanHealthNatSoilCancer(self):
        """Calculate the HumanHealthNatSoilCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_natsoil_cancer)

    def HumanHealthAgrSoilCancer(self):
        """Calculate the HumanHealthAgrSoilCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_agrsoil_cancer)
    
    def HumanHealthNonCancer(self):
        """Calculate the HumanHealthNonCancer for this chemical release, summing all the non-cancers."""
        return self.Factor(self.chemical.hhcf.hhcf_urban_air_noncanc) + \
            self.Factor(self.chemical.hhcf.hhcf_rural_air_noncanc) + \
            self.Factor(self.chemical.hhcf.hhcf_freshwater_noncanc) + \
            self.Factor(self.chemical.hhcf.hhcf_seawater_noncanc) + \
            self.Factor(self.chemical.hhcf.hhcf_natsoil_noncanc) + \
            self.Factor(self.chemical.hhcf.hhcf_agrsoil_noncanc)

    def HumanHealthUrbanAirNonCancer(self):
        """Calculate the HumanHealthUrbanAirNonCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_urban_air_noncanc)

    def HumanHealthRuralAirNonCancer(self):
        """Calculate the HumanHealthRuralAirNonCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_rural_air_noncanc)

    def HumanHealthFreshwaterNonCancer(self):
        """Calculate the HumanHealthFreshwaterNonCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_freshwater_noncanc)

    def HumanHealthSeawaterNonCancer(self):
        """Calculate the HumanHealthSeawaterNonCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_seawater_noncanc)

    def HumanHealthNatSoilNonCancer(self):
        """Calculate the HumanHealthNatSoilNonCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_natsoil_noncanc)

    def HumanHealthAgrSoilNonCancer(self):
        """Calculate the HumanHealthAgrSoilNonCancer for this chemical release."""
        return self.Factor(self.chemical.hhcf.hhcf_agrsoil_noncanc)

    def GetImpactValue(self, impact):
        """Return the value for the given impact, summing totals in the case of ecotox or hhcf"""
        if impact == "GlobalWarmingPotential":
            return this.GlobalWarmingPotential
        if impact == "Acidification":
            return this.Acidification
        if impact == "HumanHealthCriteria":
            return this.HumanHealthCriteria
        if impact == "Eutrophication":
            return this.EutrophicationAir + this.EutrophicationAir
        if impact == "EutrophicationAir":
            return this.EutrophicationAir
        if impact == "EutrophicationWater":
            return this.EutrophicationWater
        if impact == "OzoneDepletion":
            return this.OzoneDepletion
        if impact == "SmogAir":
            return this.SmogAir

        if impact == "EcoToxicity":
            return this.EcotoxCFagriculturalSoilCfreshwater + this.EcotoxCFairCfreshwater + \
                this.EcotoxCFairUfreshwater + this.EcotoxCFfreshWaterCfreshwater + \
                this.EcotoxCFfreshWaterUfreshwater + this.EcotoxCFnativeSoilCfreshwater + \
                this.EcotoxCFseaWaterCfreshwater

        if impact == "EcotoxCFairUfreshwater":
            return this.EcotoxCFairUfreshwater
        if impact == "EcotoxCFairCfreshwater":
            return this.EcotoxCFairCfreshwater
        if impact == "EcotoxCFfreshWaterCfreshwater":
            return this.EcotoxCFfreshWaterCfreshwater
        if impact == "EcotoxCFfreshWaterUfreshwater":
            return this.EcotoxCFfreshWaterUfreshwater
        if impact == "EcotoxCFseaWaterCfreshwater":
            return this.EcotoxCFseaWaterCfreshwater
        if impact == "EcotoxCFnativeSoilCfreshwater":
            return this.EcotoxCFnativeSoilCfreshwater
        if impact == "EcotoxCFagriculturalSoilCfreshwater":
            return this.EcotoxCFagriculturalSoilCfreshwater

        if impact == "HumanHealthCancer":
            return this.HumanHealthUrbanAirCancer + this.HumanHealthSeawaterCancer + \
                this.HumanHealthRuralAirCancer + this.HumanHealthNativeSoilCancer + \
                his.HumanHealthFreshwaterCancer + this.HumanHealthAgriculturalSoilCancer

        if impact == "HumanHealthNonCancer":
            return this.HumanHealthUrbanAirNonCancer + this.HumanHealthSeawaterNonCancer + \
                this.HumanHealthRuralAirNonCancer + this.HumanHealthNativeSoilNonCancer + \
                this.HumanHealthFreshwaterNonCancer + this.HumanHealthAgriculturalSoilNonCancer

        if impact == "HumanHealthUrbanAirCancer":
            return this.HumanHealthUrbanAirCancer
        if impact == "HumanHealthUrbanAirNonCancer":
            return this.HumanHealthUrbanAirNonCancer
        if impact == "HumanHealthRuralAirCancer":
            return this.HumanHealthRuralAirCancer
        if impact == "HumanHealthRuralAirNonCancer":
            return this.HumanHealthRuralAirNonCancer
        if impact == "HumanHealthFreshwaterCancer":
            return this.HumanHealthFreshwaterCancer
        if impact == "HumanHealthFreshwaterNonCancer":
            return this.HumanHealthFreshwaterNonCancer
        if impact == "HumanHealthSeawaterCancer":
            return this.HumanHealthSeawaterCancer
        if impact == "HumanHealthSeawaterNonCancer":
            return this.HumanHealthSeawaterNonCancer
        if impact == "HumanHealthNativeSoilCancer":
            return this.HumanHealthNativeSoilCancer
        if impact == "HumanHealthNativeSoilNonCancer":
            return this.HumanHealthNativeSoilNonCancer
        if impact == "HumanHealthAgriculturalSoilCancer":
            return this.HumanHealthAgriculturalSoilCancer
        if impact == "HumanHealthAgriculturalSoilNonCancer":
            return this.HumanHealthAgriculturalSoilNonCancer
        return 0

        def GetImpactFactor(self, impact):
            """Based on the impact, return the factor string (description)."""
            if impact == "GlobalWarmingPotential":
                return "kg CO2"
            if impact == "Acidification":
                return "moles H+ equiv"
            if impact == "HumanHealthCriteria":
                return "total DALYs"
            if impact == "EutrophicationAir":
                return "kg N"
            if impact == "EutrophicationWater":
                return "kg N"
            if impact == "OzoneDepletion":
                return "kg CFC-11"
            if impact == "SmogAir":
                return "g NOX equiv"
            if impact == "EcotoxCFairUfreshwater":
                return "lbs 2,4-D equiv"
            if impact == "EcotoxCFairCfreshwater":
                return "lbs 2,4-D equiv"
            if impact == "EcotoxCFfreshWaterCfreshwater":
                return "lbs 2,4-D equiv"
            if impact == "EcotoxCFfreshWaterUfreshwater":
                return "lbs 2,4-D equiv"
            if impact == "EcotoxCFseaWaterCfreshwater":
                return "lbs 2,4-D equiv"
            if impact == "EcotoxCFnativeSoilCfreshwater":
                return "lbs 2,4-D equiv"
            if impact == "EcotoxCFagriculturalSoilCfreshwater":
                return "lbs 2,4-D equiv"
            if impact == "HumanHealthUrbanAirCancer":
                return "lbs C6H6 equiv"
            if impact == "HumanHealthUrbanAirNonCancer":
                return "lbs C7H7 equiv"
            if impact == "HumanHealthRuralAirCancer":
                return "lbs C6H6 equiv"
            if impact == "HumanHealthRuralAirNonCancer":
                return "lbs C7H7 equiv"
            if impact == "HumanHealthFreshwaterCancer":
                return "lbs C6H6 equiv"
            if impact == "HumanHealthFreshwaterNonCancer":
                return "lbs C7H7 equiv"
            if impact == "HumanHealthSeawaterCancer":
                return "lbs C6H6 equiv"
            if impact == "HumanHealthSeawaterNonCancer":
                return "lbs C7H7 equiv"
            if impact == "HumanHealthNativeSoilCancer":
                return "lbs C6H6 equiv"
            if impact == "HumanHealthNativeSoilNonCancer":
                return "lbs C7H7 equiv"
            if impact == "HumanHealthAgriculturalSoilCancer":
                return "lbs C6H6 equiv"
            return "lbs C7H7 equiv"