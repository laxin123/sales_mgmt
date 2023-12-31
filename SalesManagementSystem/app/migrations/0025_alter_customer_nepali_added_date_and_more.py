# Generated by Django 4.2.4 on 2023-10-15 07:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0024_daily_total'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='nepali_added_date',
            field=models.CharField(blank=True, default='28-Aswin-2080', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='dailytransaction',
            name='quantity',
            field=models.FloatField(),
        ),
        migrations.AlterField(
            model_name='expenses',
            name='nepali_create_date',
            field=models.CharField(default='28 Aswin 2080', max_length=200),
        ),
        migrations.AlterField(
            model_name='inventoryproduct',
            name='nepali_create_date',
            field=models.CharField(default='28 Aswin 2080', max_length=200),
        ),
        migrations.AlterField(
            model_name='purchase',
            name='nepali_create_date',
            field=models.CharField(blank=True, default='28-Aswin-2080', editable=False, max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='purchaseitem',
            name='nepali_create_date',
            field=models.CharField(blank=True, default='28-Aswin-2080', editable=False, max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='purchaseparty',
            name='nepali_create_date',
            field=models.CharField(default='28 Aswin 2080', max_length=200),
        ),
        migrations.AlterField(
            model_name='sales',
            name='nepali_create_date',
            field=models.CharField(blank=True, default='28-Aswin-2080', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='salesitem',
            name='nepali_create_date',
            field=models.CharField(default='28-Aswin-2080', max_length=200),
        ),
    ]
