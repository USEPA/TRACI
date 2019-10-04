# Generated by Django 2.2.6 on 2019-10-03 19:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('substances', '0001_initial'),
        ('projects', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='LifeCycleStage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='LifeCycleStageName',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=63)),
            ],
        ),
        migrations.CreateModel(
            name='Location',
            fields=[
                ('geogid', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=63, null=True)),
                ('abbreviation', models.CharField(blank=True, max_length=63, null=True)),
                ('ewid', models.IntegerField(blank=True, null=True)),
                ('region_id', models.IntegerField(blank=True, null=True)),
                ('geo_level_id', models.IntegerField(blank=True, null=True)),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='products.Location')),
            ],
        ),
        migrations.CreateModel(
            name='Media',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=31)),
            ],
        ),
        migrations.CreateModel(
            name='Process',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('lifecyclestage', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.LifeCycleStage')),
                ('location', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Location')),
            ],
        ),
        migrations.CreateModel(
            name='ProcessName',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=63)),
            ],
        ),
        migrations.CreateModel(
            name='ResourceReleaseType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=63)),
                ('type', models.CharField(max_length=63)),
            ],
        ),
        migrations.CreateModel(
            name='ResourceRelease',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.FloatField(blank=True, default=0, null=True)),
                ('media', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='products.Media')),
                ('process', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Process')),
                ('substance', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='substances.Substance')),
                ('type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.ResourceReleaseType')),
                ('unit', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='substances.Unit')),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('project', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projects.Project')),
            ],
        ),
        migrations.AddField(
            model_name='process',
            name='name',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.ProcessName'),
        ),
        migrations.AddField(
            model_name='lifecyclestage',
            name='name',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.LifeCycleStageName'),
        ),
        migrations.AddField(
            model_name='lifecyclestage',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Product'),
        ),
    ]
