# Generated by Django 4.2.4 on 2023-10-09 10:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0013_alter_customer_nepali_added_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='nepali_added_date',
            field=models.CharField(blank=True, default='22-Aswin-2080', max_length=200, null=True),
        ),
    ]
