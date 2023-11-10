# Generated by Django 4.2.4 on 2023-10-12 07:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0017_alter_customer_nepali_added_date_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='dailytransaction',
            name='unite',
            field=models.ForeignKey(db_constraint=False, default=1, on_delete=django.db.models.deletion.DO_NOTHING, related_name='daily_product_unit', to='app.productunit'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='dailytransaction',
            name='nepali_date',
            field=models.CharField(blank=True, default='25-Aswin-2080', max_length=200, null=True),
        ),
    ]
