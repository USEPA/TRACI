# pylint: skip-file

import os
from django.core import serializers
from django.db import migrations, transaction
from django.db.utils import IntegrityError

fixture_dir = os.path.abspath(
    os.path.join(os.path.dirname(__file__), '../fixtures'))

fixture_filenames = ['lifecyclestagename.json', 'location.json',
                     'media.json']
# 'resourcereleasetype.json'

def load_fixture(_apps, _schema_editor):
    """Load data from a fixture when running migrations"""
    for fixture_filename in fixture_filenames:
        fixture_file = os.path.join(fixture_dir, fixture_filename)
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
        ('products', '0003_auto_20191010_1109'),
    ]

    operations = [
        migrations.RunPython(load_fixture, migrations.RunPython.noop),
        # Set the auto increment value to start after the imported fixture ids
        migrations.RunSQL("SELECT setval('products_lifecyclestagename_id_seq', max(id)) FROM products_lifecyclestagename;", migrations.RunSQL.noop),
        # migrations.RunSQL("SELECT setval('products_location_id_seq', max(id)) FROM products_location;", migrations.RunSQL.noop),
        migrations.RunSQL("SELECT setval('products_media_id_seq', max(id)) FROM products_media;", migrations.RunSQL.noop),
        # migrations.RunSQL("SELECT setval('xxxxxxxxxxxxxxxx_id_seq', max(id)) FROM products_resourcereleasetype;", migrations.RunSQL.noop),
    ]
