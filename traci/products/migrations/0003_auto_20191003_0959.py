# Generated by Django 2.2.6 on 2019-10-03 13:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0002_loaddata'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='location',
            name='id',
        ),
        migrations.RemoveField(
            model_name='location',
            name='parent',
        ),
        migrations.AddField(
            model_name='location',
            name='abbreviation',
            field=models.CharField(blank=True, max_length=63, null=True),
        ),
        migrations.AddField(
            model_name='location',
            name='ewid',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='location',
            name='geo_level_id',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='location',
            name='geogid',
            field=models.IntegerField(default=0, primary_key=True, serialize=False),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='location',
            name='parent_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='products.Location'),
        ),
        migrations.AddField(
            model_name='location',
            name='region_id',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='location',
            name='name',
            field=models.CharField(blank=True, max_length=63, null=True),
        ),
    ]
