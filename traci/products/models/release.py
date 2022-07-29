# models/release.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
"""
Models for Chemical Releases.

Available models:
- Release an instance of a chemical release under some parent process.
"""

from django.db import models
from chemicals.models import Chemical, Unit
from chemicals.util import ReleaseFactor


# Substance type "Chemical Release"
class Release(models.Model):
    """Information for a Chemical Release (output)."""
    # Chemical/chemical
    chemical = models.ForeignKey(Chemical, on_delete=models.CASCADE)
    release_quantity = models.FloatField(blank=True, null=True, default=0)
    release_unit = models.ForeignKey(Unit, on_delete=models.CASCADE)
    # Media through which the Releases are output, null if Resource/Input.
    release_media = models.ForeignKey("Media",
                                      on_delete=models.SET_NULL,
                                      blank=True,
                                      null=True)
    # Parent process reference
    process = models.ForeignKey("Process", on_delete=models.CASCADE)

    # ReleaseImpactFactor is the data from Excel tool, now stored
    # in the following Chemical tables:
    # chemicals_chemical, chemicals_ecotox, chemicals_fossilfuel,
    # chemicals_hhcf, chemicals_unit

    def __factor(self, emission):
        try:
            return float(emission) * self.release_quantity * ReleaseFactor(
                self.release_unit)
        except (ValueError, TypeError):
            return 0

    def GlobalWarmingPotential(self):
        """Calculate the GlobalWarmingPotential for this chemical release."""
        return self.__factor(self.chemical.global_warming_air)

    def Acidification(self):
        """Calculate the Acidification for this chemical release."""
        return self.__factor(self.chemical.acidification_air)

    def HumanHealthCriteria(self):
        """Calculate the HumanHealthCriteria for this chemical release."""
        return self.__factor(self.chemical.hh_particulate_air)

    def OzoneDepletion(self):
        """Calculate the OzoneDepletion for this chemical release."""
        return self.__factor(self.chemical.ozone_depletion_air)

    def SmogAir(self):
        """Calculate the SmogAir for this chemical release."""
        return self.__factor(self.chemical.smog_air)

    # Ecotox section
    # The functions in VB program don't match the data from the Excel sheet
    # (which is in the PSQL DB).
    # Therefore, we will be focusing on the data in the Excel Sheet/PSQL DB.
    def EcotoxAirU(self):
        """Calculate the EcotoxAirU for this chemical release."""
        return self.__factor(self.chemical.ecotox.ecotox_airu)

    def EcotoxAirC(self):
        """Calculate the EcotoxAirC for this chemical release."""
        return self.__factor(self.chemical.ecotox.ecotox_airc)

    def EcotoxWaterC(self):
        """Calculate the EcotoxWaterC for this chemical release."""
        return self.__factor(self.chemical.ecotox.ecotox_waterc)

    def EcotoxSeaWaterC(self):
        """Calculate the EcotoxSeaWaterC for this chemical release."""
        return self.__factor(self.chemical.ecotox.ecotox_seawaterc)

    def EcotoxNatSoilC(self):
        """Calculate the EcotoxNatSoilC for this chemical release."""
        return self.__factor(self.chemical.ecotox.ecotox_nat_soilc)

    def EcotoxAgrSoilC(self):
        """Calculate the EcotoxAgrSoilC for this chemical release."""
        return self.__factor(self.chemical.ecotox.ecotox_agr_soilc)

    # Human Health section
    # The functions in VB program don't match the data from the Excel sheet
    # (which is in the PSQL DB).
    # Therefore, we will be focusing on the data in the Excel Sheet/PSQL DB.
    def HumanHealthCancer(self):
        """
        Calculate the HumanHealthCancer for this chemical release,
        summing all the cancers.
        """
        return self.__factor(self.chemical.hhcf.hhcf_urban_air_cancer) + \
            self.__factor(self.chemical.hhcf.hhcf_rural_air_cancer) + \
            self.__factor(self.chemical.hhcf.hhcf_freshwater_cancer) + \
            self.__factor(self.chemical.hhcf.hhcf_seawater_cancer) + \
            self.__factor(self.chemical.hhcf.hhcf_natsoil_cancer) + \
            self.__factor(self.chemical.hhcf.hhcf_agrsoil_cancer)

    def HumanHealthUrbanAirCancer(self):
        """
        Calculate the HumanHealthUrbanAirCancer for this chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_urban_air_cancer)

    def HumanHealthRuralAirCancer(self):
        """
        Calculate the HumanHealthRuralAirCancer for this chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_rural_air_cancer)

    def HumanHealthFreshwaterCancer(self):
        """
        Calculate the HumanHealthFreshwaterCancer for this chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_freshwater_cancer)

    def HumanHealthSeawaterCancer(self):
        """
        Calculate the HumanHealthSeawaterCancer for this chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_seawater_cancer)

    def HumanHealthNativeSoilCancer(self):
        """Calculate the HumanHealthNatSoilCancer for this chemical release."""
        return self.__factor(self.chemical.hhcf.hhcf_natsoil_cancer)

    def HumanHealthAgriculturalSoilCancer(self):
        """
        Calculate the HumanHealthAgriculturalSoilCancer for this
        chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_agrsoil_cancer)

    def HumanHealthNonCancer(self):
        """
        Calculate the HumanHealthNonCancer for this chemical release,
        summing all the non-cancers.
        """
        return self.__factor(self.chemical.hhcf.hhcf_urban_air_noncanc) + \
            self.__factor(self.chemical.hhcf.hhcf_rural_air_noncanc) + \
            self.__factor(self.chemical.hhcf.hhcf_freshwater_noncanc) + \
            self.__factor(self.chemical.hhcf.hhcf_seawater_noncanc) + \
            self.__factor(self.chemical.hhcf.hhcf_natsoil_noncanc) + \
            self.__factor(self.chemical.hhcf.hhcf_agrsoil_noncanc)

    def HumanHealthUrbanAirNonCancer(self):
        """
        Calculate the HumanHealthUrbanAirNonCancer for this chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_urban_air_noncanc)

    def HumanHealthRuralAirNonCancer(self):
        """
        Calculate the HumanHealthRuralAirNonCancer for this chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_rural_air_noncanc)

    def HumanHealthFreshwaterNonCancer(self):
        """
        Calculate the HumanHealthFreshwaterNonCancer for this chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_freshwater_noncanc)

    def HumanHealthSeawaterNonCancer(self):
        """
        Calculate the HumanHealthSeawaterNonCancer for this chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_seawater_noncanc)

    def HumanHealthNativeSoilNonCancer(self):
        """
        Calculate the HumanHealthNativeSoilNonCancer for this chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_natsoil_noncanc)

    def HumanHealthAgriculturalSoilNonCancer(self):
        """
        Calculate the HumanHealthAgrSoilNonCancer for this chemical release.
        """
        return self.__factor(self.chemical.hhcf.hhcf_agrsoil_noncanc)

    def GetImpactValue(self, impact):
        """
        Return the value for the given impact,
        summing totals in the case of ecotox or hhcf.
        """
        if impact == "GlobalWarmingPotential":
            return self.GlobalWarmingPotential()
        if impact == "Acidification":
            return self.Acidification()
        if impact == "HumanHealthCriteria":
            return self.HumanHealthCriteria()
        if impact == "OzoneDepletion":
            return self.OzoneDepletion()
        if impact == "SmogAir":
            return self.SmogAir()
        if impact == "EcoToxicity":
            return self.EcotoxCFagriculturalSoilCfreshwater() + \
                self.EcotoxCFairCfreshwater() + \
                self.EcotoxCFairUfreshwater() + \
                self.EcotoxCFfreshWaterCfreshwater() + \
                self.EcotoxCFfreshWaterUfreshwater() + \
                self.EcotoxCFnativeSoilCfreshwater() + \
                self.EcotoxCFseaWaterCfreshwater()
        if impact == "EcotoxCFairUfreshwater":
            return self.EcotoxCFairUfreshwater()
        if impact == "EcotoxCFairCfreshwater":
            return self.EcotoxCFairCfreshwater()
        if impact == "EcotoxCFfreshWaterCfreshwater":
            return self.EcotoxCFfreshWaterCfreshwater()
        if impact == "EcotoxCFfreshWaterUfreshwater":
            return self.EcotoxCFfreshWaterUfreshwater()
        if impact == "EcotoxCFseaWaterCfreshwater":
            return self.EcotoxCFseaWaterCfreshwater()
        if impact == "EcotoxCFnativeSoilCfreshwater":
            return self.EcotoxCFnativeSoilCfreshwater()
        if impact == "EcotoxCFagriculturalSoilCfreshwater":
            return self.EcotoxCFagriculturalSoilCfreshwater()
        if impact == "HumanHealthCancer":
            return self.HumanHealthUrbanAirCancer() + \
                self.HumanHealthSeawaterCancer() + \
                self.HumanHealthRuralAirCancer() + \
                self.HumanHealthNativeSoilCancer() + \
                self.HumanHealthFreshwaterCancer() + \
                self.HumanHealthAgriculturalSoilCancer()
        if impact == "HumanHealthNonCancer":
            return self.HumanHealthUrbanAirNonCancer() + \
                self.HumanHealthSeawaterNonCancer() + \
                self.HumanHealthRuralAirNonCancer() + \
                self.HumanHealthNativeSoilNonCancer() + \
                self.HumanHealthFreshwaterNonCancer() + \
                self.HumanHealthAgriculturalSoilNonCancer()
        if impact == "HumanHealthUrbanAirCancer":
            return self.HumanHealthUrbanAirCancer()
        if impact == "HumanHealthUrbanAirNonCancer":
            return self.HumanHealthUrbanAirNonCancer()
        if impact == "HumanHealthRuralAirCancer":
            return self.HumanHealthRuralAirCancer()
        if impact == "HumanHealthRuralAirNonCancer":
            return self.HumanHealthRuralAirNonCancer()
        if impact == "HumanHealthFreshwaterCancer":
            return self.HumanHealthFreshwaterCancer()
        if impact == "HumanHealthFreshwaterNonCancer":
            return self.HumanHealthFreshwaterNonCancer()
        if impact == "HumanHealthSeawaterCancer":
            return self.HumanHealthSeawaterCancer()
        if impact == "HumanHealthSeawaterNonCancer":
            return self.HumanHealthSeawaterNonCancer()
        if impact == "HumanHealthNativeSoilCancer":
            return self.HumanHealthNativeSoilCancer()
        if impact == "HumanHealthNativeSoilNonCancer":
            return self.HumanHealthNativeSoilNonCancer()
        if impact == "HumanHealthAgriculturalSoilCancer":
            return self.HumanHealthAgriculturalSoilCancer()
        if impact == "HumanHealthAgriculturalSoilNonCancer":
            return self.HumanHealthAgriculturalSoilNonCancer()
        return 0

        def GetImpactFactor(self, impact):
            """Based on the impact, return the factor string (description)."""
            if impact == "GlobalWarmingPotential":
                return "kg CO2"
            if impact == "Acidification":
                return "moles H+ equiv"
            if impact == "HumanHealthCriteria":
                return "total DALYs"
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
