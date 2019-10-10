# util.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
This file contains utility classes and functions.

Available Classes/Functions:
- Conversion Factors for retrieving various conversion factors.
"""

class ConversionFactors():
    """A utility class containing methods for retrieving various factors."""

    # TODO Refactor the units database. It doesn't quite match the logic in the old software...
    
    def ReleaseFactor(self, uom):
        """Retrieve the conversion factor for a Release unit."""
        if uom == 'gram' or uom == 'gm':
            return 0.001
        if uom == 'kilogram' or uom == 'kg':
            return 1.0
        # TODO Verify this is the correct db entry, 'Mg'
        if uom == 'megagram' or uom == 'Mg':
            return 1000
        if uom == 'milligram' or uom == 'mg':
            return 0.000001
        if uom == 'pound' or uom == 'lb':
            return 0.45359237
        return 2000 * 0.45359237

    def CoalFactor(self, uom):
        """Retrieve the conversion factor for a Coal unit."""
        if uom == 'btu':
            return 0.0010545
        if uom in ('kilogram', 'kg'):
            return 24900
        if uom == 'megajoule':
            return 1.0
        if uom == 'millionBTU':
            return 1054.5
        if uom in ('pound', 'lb'):
            return 11300
        return 22600000

    def OilFactor(self, uom):
        """Retrieve the conversion factor for an Oil unit."""
        if uom == 'btu' or uom == 'xxxxxxx':
            return 0.0010545
        if uom in ('kilogram', 'kg'):
            return 0.0000000461525620459621 # 41.868e3 MJ/ton  / 907.18474 kg/ton;
        if uom == 'megajoule':
            return 1.0
        if uom == 'millionBTU':
            return 1054.5
        if uom in ('pound', 'lb'):
            return 11300
        return 41868

    def NaturalGasFactor(self, uom):
        """Retrieve the conversion factor for a NaturalGas unit."""
        if uom == 'btu':
            return 0.0010545
        if uom in('cubicmeter', 'M3'):
            return 38.1
        if uom == 'hundredcubicfeet':
            return 105505585.262
        # Derived from previous UOM
        if uom in ('CF', 'scf', 'Cu Ft'):
            return 1055055.85262
        if uom in ('kilogram', 'kg'):
            return 49
        if uom == 'megajoule':
            return 1.0
        if uom == 'millionBTU':
            return 1054.5
        if uom in ('pound', 'lb'):
            return 49 * 0.45359237
        if uom == 'thousandcubicfeet':
            return 1055055852.62
        return 105.4804

    def LandUseFactor(self, uom):
        """Retrieve the conversion factor for a LandUse unit."""
        if uom in ('acre', 'Acres'):
            return 0.0015625
        if uom == 'hectare':
            return 0.00386102
        if uom in ('squarefoot', 'SQ.Ft'):
            return .00000003587
        if uom in ('squarekilometer', 'SQ.Km'):
            return 0.386102
        return 1

    def WaterUseFactor(self, uom):
        """Retrieve the conversion factor for a WaterUse unit."""
        if uom in ('gallon', 'GAL'):
            return 1.0
        if uom in ('liter', 'L'):
            return 0.2642
        return 1000000
