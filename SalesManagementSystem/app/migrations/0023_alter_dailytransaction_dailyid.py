# Generated by Django 4.2.4 on 2023-10-12 09:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0022_alter_daily_nepali_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dailytransaction',
            name='dailyid',
            field=models.ForeignKey(blank=True, db_constraint=False, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='dailyId', to='app.daily'),
        ),
    ]