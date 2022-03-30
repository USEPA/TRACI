# models.py (constants)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
"""
Models for the traci application for constants.

Available functions:
-
"""

AREA_CHOICES = (
    ('', ''),
    ('Economy', 'Economy'),
    ('Efficiency', 'Efficiency'),
    ('Energy', 'Energy'),
    ('Environment', 'Environment'),
)

DEPRECIATION_CHOICES = (
    ('', ''),
    ('Straight Line', 'Straight Line'),
)

FEEDSTOCK_CHOICES = (
    ('', ''),
    ('FEEDSTOCK', 'Feedstock'),
    ('PRODUCT', 'Product'),
    ('WASTE', 'Waste'),
    ('CATALYST', 'Catalyst'),
    ('SOLVENT', 'Global Reagent and Solvent'),
    ('OTHER', 'Other'),
)
FUNCTION_CHOICES = (
    ('', ''),
    ('{{BASE_URL}}compounds/create/', 'Create Compound Library'),
)

O_OR_C_CHOICES = (('O', 'O'), ('C', 'C'))

PROJECT_STATUS_CHOICES = (('ACTIVE', 'ACTIVE'), ('IN ACTIVE', 'IN ACTIVE'),
                          ('IN PROGRESS', 'IN PROGRESS'))
PROMOTOR_CHOICES = (('', ''), ('PROMOTOR', 'PROMOTOR'), ('POISON', 'POISON'))

CHOICES_YES_NO = ((False, 'No'), (True, 'Yes'))
STEAM_CHOICES = (('medium', 'Medium Pressure Steam'),
                 ('low', 'Low Pressure Steam'), ('high',
                                                 'High Pressure Steam'))

SUBJECT_CHOICES = (('General Inquiry', 'General Inquiry'),
                   ('Send Me More Info', 'Send Me More Info'),
                   ('Registration Problem',
                    'Registration Problem'), ('Log-In Issue', 'Log-In Issue'))
SUBMISSION_CHOICES = (('Submitted', 'Submitted'),
                      ('Under Review', 'Under Review'), ('Accepted',
                                                         'Accepted'))
SUPPORT_CHOICES = (('', ''), ('GREENSCOPE', 'GREENSCOPE Values'),
                   ('Help', 'Help'), ('Feature', 'Feature Request'), ('Other',
                                                                      'Other'))

TODO_STATUS_CHOICES = (('', ''), ('Emergency', 'Emergency'), ('Important',
                                                              'Important'),
                       ('Back Burner', 'Back Burner'), ('Complete',
                                                        'Complete'))

WGK_CHOICES = (('', ''), ('0', 'nwg'), ('1', 'WGK 1'), ('2', 'WGK 2'),
               ('3', 'WGK 3'))

YN_CHOICES = (('', ''), ('Y', 'Yes'), ('N', 'No'))
ONLY_YN_CHOICES = (('Y', 'Y'), )

TRACI_FLAG_OPTIONS = (('N/A', 'n/a'), ('RECOMMENDED', 'Recommended'),
                      ('INTERIM', 'Interim'))
DEFAULT_TRACI_FLAG = 'N/A'

TRACI_SCOPE_OPTIONS = (('cradle_to_grave', 'Cradle to Grave'),
                       ('cradle_to_entry_gate', 'Cradle to Entry Gate'),
                       ('entry_gate_to_exit_gate', 'Entry Gate to Exit Gate'),
                       ('exit_gate_to_grave', 'Exit Gate to Grave'))
