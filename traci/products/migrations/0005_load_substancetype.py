# pylint: skip-file

import os
from django.core import serializers
from django.db import migrations, transaction
from django.db.utils import IntegrityError

fixture_dir = os.path.abspath(
    os.path.join(os.path.dirname(__file__), '../fixtures'))

fixture_filename = 'substancetype.json'


def load_fixture(*args, **kwargs):
    """Load data from a fixture when running migrations"""
    fixture_file = os.path.join(fixture_dir, fixture_filename)
    fixture = open(fixture_file, 'rb')
    objects = serializers.deserialize('json', fixture, ignorenonexistent=True)
    for obj in objects:
        try:
            with transaction.atomic():
                obj.save()
        except IntegrityError:
            pass  # Ignore if duplicate obj already exists in db
    fixture.close()


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0004_load_fixtures'),
    ]
    incr_seq = "SELECT setval('products_substancetype_id_seq', " + \
        "max(id)) FROM products_substancetype;"
    operations = [
        migrations.RunPython(load_fixture, migrations.RunPython.noop),
        migrations.RunSQL(incr_seq, migrations.RunSQL.noop),
    ]
