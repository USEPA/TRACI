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

    def ReleaseFactor(uom):
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

    def CoalFactor(uom):
        """Retrieve the conversion factor for a Coal unit."""
        if uom == 'btu' or uom == 'xxxxxxx':
            return 0.0010545
        if uom == 'kilogram' or uom == 'kg':
            return 24900
        if uom == 'megajoule' or uom == 'xxxxxxx':
            return 1.0
        if uom == 'millionBTU' or uom == 'xxxxxxx':
            return 1054.5
        if uom == 'pound' or uom == 'lb':
            return 11300
        return 22600000

    def OilFactor(uom):
        """Retrieve the conversion factor for an Oil unit."""
        if uom == 'btu' or uom == 'xxxxxxx':
            return 0.0010545
        if uom == 'kilogram' or uom == 'kg':
            return 0.0000000461525620459621 # 41.868e3 MJ/ton  / 907.18474 kg/ton;
        if uom == 'megajoule' or uom == 'xxxxxxx':
            return 1.0
        if uom == 'millionBTU' or uom == 'xxxxxxx':
            return 1054.5
        if uom == 'pound' or uom == 'lb':
            return 11300
        return 41868

    def NaturalGasFactor(uom):
        """Retrieve the conversion factor for a NaturalGas unit."""
        if uom == 'btu' or uom == 'xxxxxxx':
            return 0.0010545
        if uom == 'cubicmeter' or uom == 'M3':
            return 38.1
        if uom == 'hundredcubicfeet':
            return 105505585.262
        # Derived from previous UOM
        if uom == 'CF' or uom == 'scf' or uom == 'Cu Ft':
            return 1055055.85262
        if uom == 'kilogram' or uom == 'kg':
            return 49
        if uom == 'megajoule' or uom == 'xxxxxxx':
            return 1.0
        if uom == 'millionBTU' or uom == 'xxxxxxx':
            return 1054.5
        if uom == 'pound' or uom == 'lb':
            return 49 * 0.45359237
        if uom == 'thousandcubicfeet' or uom == 'xxxxxxx':
            return 1055055852.62
        return 105.4804

    def LandUseFactor(uom):
        """Retrieve the conversion factor for a LandUse unit."""
        if uom == 'acre' or uom == 'Acres':
            return 0.0015625
        if uom == 'hectare' or uom == 'xxxxxxx':
            return 0.00386102
        if uom == 'squarefoot' or uom == 'SQ.Ft':
            return .00000003587
        if uom == 'squarekilometer' or uom == 'SQ.Km':
            return 0.386102
        return 1

    def WaterUseFactor(uom):
        """Retrieve the conversion factor for a WaterUse unit."""
        if uom == 'gallon' or uom == 'GAL':
            return 1.0
        if uom == 'liter' or uom == 'L':
            return 0.2642
        return 1000000
