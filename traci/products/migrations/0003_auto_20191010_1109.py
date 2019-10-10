# Generated by Django 2.2.6 on 2019-10-10 15:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('chemicals', '0001_initial'),
        ('products', '0002_auto_20191004_1619'),
    ]

    operations = [
        migrations.CreateModel(
            name='LandUse',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=63)),
            ],
        ),
        migrations.CreateModel(
            name='WaterUse',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=63)),
            ],
        ),
        migrations.AddField(
            model_name='resource',
            name='fossil_fuel',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='chemicals.FossilFuel'),
        ),
        migrations.AddField(
            model_name='resource',
            name='land_use',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='products.LandUse'),
        ),
        migrations.AddField(
            model_name='resource',
            name='water_use',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='products.WaterUse'),
        ),
    ]
