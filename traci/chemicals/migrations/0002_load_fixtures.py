# pylint: skip-file

import os
from django.core import serializers
from django.db import migrations, transaction
from django.db.utils import IntegrityError

fixture_dir = os.path.abspath(
    os.path.join(os.path.dirname(__file__), '../fixtures'))

fixture_filenames = ['chemicals_initial_data.json', 'unit.json']


def load_fixture(_apps, _schema_editor):
    """Load data from a fixture when running migrations"""
    for fixture_filename in fixture_filenames:
        fixture_file = os.path.join(fixture_dir, fixture_filename)
        fixture = open(fixture_file, 'rb')
        objects = serializers.deserialize('json',
                                          fixture,
                                          ignorenonexistent=True)
        for obj in objects:
            try:
                with transaction.atomic():
                    obj.save()
            except IntegrityError:
                pass  # Ignore if duplicate obj already exists in db
        fixture.close()


class Migration(migrations.Migration):

    dependencies = [
        ('chemicals', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(load_fixture, migrations.RunPython.noop),
        migrations.RunSQL(
            "SELECT setval('chemicals_unit_id_seq', max(id)) FROM chemicals_unit;",
            migrations.RunSQL.noop),
        # Substances includes several tables, so make sure to update all of them:
        # chemicals_chemical, chemicals_ecotox, chemicals_fossilfuel, chemicals_hhcf
        migrations.RunSQL(
            "SELECT setval('chemicals_chemical_id_seq', max(id)) FROM chemicals_chemical;",
            migrations.RunSQL.noop),
        migrations.RunSQL(
            "SELECT setval('chemicals_ecotox_id_seq', max(id)) FROM chemicals_ecotox;",
            migrations.RunSQL.noop),
        migrations.RunSQL(
            "SELECT setval('chemicals_fossilfuel_id_seq', max(id)) FROM chemicals_fossilfuel;",
            migrations.RunSQL.noop),
        migrations.RunSQL(
            "SELECT setval('chemicals_hhcf_id_seq', max(id)) FROM chemicals_hhcf;",
            migrations.RunSQL.noop),
    ]
