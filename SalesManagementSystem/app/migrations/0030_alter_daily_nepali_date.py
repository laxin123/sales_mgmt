# Generated by Django 4.2.4 on 2023-11-02 08:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0029_alter_daily_nepali_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='daily',
            name='nepali_date',
            field=models.CharField(blank=True, default='16 Kartik 2080', max_length=200, null=True),
        ),
    ]
