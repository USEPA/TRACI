# Generated by Django 2.2.6 on 2019-10-02 19:37
# pylint: skip-file

import os
from django.core import serializers
from django.db import migrations, transaction
from django.db.utils import IntegrityError

fixture_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '../fixtures'))
fixture_lifecyclestagename = 'lifecyclestagename.json'
fixture_location = 'location.json'
fixture_resourcereleasetype = 'resourcereleasetype.json'
fixture_media = 'media.json'

def load_lifecyclestagenames(_apps, _schema_editor):
    """Load data from lifecyclestagenames fixture when running migrations"""
    load_fixture(_apps, _schema_editor, fixture_lifecyclestagename)
    

def load_locations(_apps, _schema_editor):
    """Load data from locations fixture when running migrations"""
    load_fixture(_apps, _schema_editor, fixture_location)


def load_resourcereleasetypes(_apps, _schema_editor):
    """Load data from resourcereleasetypes fixture when running migrations"""
    load_fixture(_apps, _schema_editor, fixture_resourcereleasetype)
    

def load_media(_apps, _schema_editor):
    """Load data from media fixture when running migrations"""
    load_fixture(_apps, _schema_editor, fixture_media)


def load_fixture(_apps, _schema_editor, filename):
    """Load data from a fixture when running migrations"""
    fixture_file = os.path.join(fixture_dir, filename)
    fixture = open(fixture_file, 'rb')
    objects = serializers.deserialize('json', fixture, ignorenonexistent=True)
    for obj in objects:
        try:
            with transaction.atomic():
                obj.save()
        except IntegrityError:
            pass    # Ignore if duplicate obj already exists in db
    fixture.close()


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(load_lifecyclestagenames),
        migrations.RunPython(load_locations),
        migrations.RunPython(load_resourcereleasetypes),
        migrations.RunPython(load_media),
    ]