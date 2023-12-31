# Generated by Django 4.2.4 on 2023-11-02 08:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0027_alter_customer_nepali_added_date_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='nepali_added_date',
            field=models.CharField(blank=True, default='16-Kartik-2080', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='daily',
            name='nepali_date',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='expenses',
            name='nepali_create_date',
            field=models.CharField(default='16 Kartik 2080', max_length=200),
        ),
        migrations.AlterField(
            model_name='inventoryproduct',
            name='nepali_create_date',
            field=models.CharField(default='16 Kartik 2080', max_length=200),
        ),
        migrations.AlterField(
            model_name='purchase',
            name='nepali_create_date',
            field=models.CharField(blank=True, default='16-Kartik-2080', editable=False, max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='purchaseitem',
            name='nepali_create_date',
            field=models.CharField(blank=True, default='16-Kartik-2080', editable=False, max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='purchaseparty',
            name='nepali_create_date',
            field=models.CharField(default='16 Kartik 2080', max_length=200),
        ),
        migrations.AlterField(
            model_name='sales',
            name='nepali_create_date',
            field=models.CharField(blank=True, default='16-Kartik-2080', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='salesitem',
            name='nepali_create_date',
            field=models.CharField(default='16-Kartik-2080', max_length=200),
        ),
    ]
