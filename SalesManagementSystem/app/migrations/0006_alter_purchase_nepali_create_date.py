# Generated by Django 4.2.4 on 2023-10-08 04:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0005_alter_purchaseitem_nepali_create_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='purchase',
            name='nepali_create_date',
            field=models.CharField(blank=True, default='21-Aswin-2080', editable=False, max_length=200, null=True),
        ),
    ]
