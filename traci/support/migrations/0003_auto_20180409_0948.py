# Generated by Django 2.0.3 on 2018-04-09 13:48
# pylint: skip-file
# SKIP THIS FILE BECAUSE IT IS GENERATED BY DJANGO

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('support', '0002_auto_20170829_1252'),
    ]

    operations = [
        migrations.RenameField(
            model_name='priority',
            old_name='the_name',
            new_name='name',
        ),
        migrations.RenameField(
            model_name='support',
            old_name='the_name',
            new_name='name',
        ),
        migrations.RenameField(
            model_name='supporttype',
            old_name='the_name',
            new_name='name',
        ),
    ]