# settings.py
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# pylint: skip-file


"""
Django settings for traci project.

For more information on this file, see
https://docs.djangoproject.com/en/1.9/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.9/ref/settings/
"""

import os
import posixpath

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.9/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '7706679d-2b1b-4947-bf40-41cca1150122'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

REST_FRAMEWORK = {
    'DEFAULT_FILTER_BACKENDS': ('django_filters.rest_framework.DjangoFilterBackend',)
}

# Application definition

INSTALLED_APPS = [
    # Add your apps here to enable them
    'django.contrib.admin',
    'django.contrib.admindocs',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',
    'accounts',
    'products',
    'projects',
    'substances',
    'support',
    'teams',
    'rest_framework',
    'traci',
]

MIDDLEWARE_CLASSES = [
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
]

MIDDLEWARE = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
)

ROOT_URLCONF = 'traci.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'traci.context_processors.software_info',
            ],
            'debug': DEBUG,
        },
    },
]

WSGI_APPLICATION = 'traci.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.9/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'traci',
        'USER': 'dyoung11',
        'PASSWORD': '***REMOVED***',
        'HOST': 'localhost',
        'PORT': '5432'
    }
}


# Password validation
# https://docs.djangoproject.com/en/1.9/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.9/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

if os.name == 'nt':
    LOCALE_STRING = 'English_United States.1252'
    SCRIPT_EXT = 'bat'
else:
    LOCALE_STRING = 'en_US.UTF-8'
    SCRIPT_EXT = 'sh'

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.9/howto/static-files/

STATIC_URL = '/static/'
# STATIC_ROOT = posixpath.join(*(BASE_DIR.split(os.path.sep) + ['static']))
STATIC_ROOT = os.path.join(BASE_DIR, 'traci', 'static')


########################################################################
DOWNLOADS_DIR = os.path.join("..", "DOCS")
MANUAL_NAME = 'traciusersguide.pdf'
EXCEL_TOOL_NAME = 'TRACI_2_1_2017_April_24.xlsx'

# TODO add TRACI Citation:
CITATION = ''
CITE_SCRIPT = 'cite.' + SCRIPT_EXT

APP_NAME = 'TRACI'
APP_NAME_SHORT = 'TRACI'
APP_NAME_LONG = 'TRACI'
APP_DESCRIPTION = 'TRACI'

APP_VERSION = '0.0.01'

APP_DISCLAIMER = '''Use of TRACI, including but not limited to the impact assessment modeling,
                    does not create regulatory or scientific approval by the US EPA on any issues to which it
                    is applied, nor does it release any users from any potential liability, either administratively
                    or judicially, for any damage to human health or the environment.  The US EPA does not make
                    any warranty concerning the correctness of the database, any actions taken by third parties
                    as a result of using the model, or the merchantability or fitness for a particular
                    purpose of the model.  The EPA does not endorse any products or services.'''

APP_ENDORSEMENT = ''

try:
    from .local_settings import *  # pylint: disable=unused-wildcard-import,wildcard-import
except ImportError:
    pass
