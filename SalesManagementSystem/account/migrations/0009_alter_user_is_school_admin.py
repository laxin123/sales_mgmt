# Generated by Django 4.1.4 on 2023-07-24 16:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0008_remove_user_is_super_admin_user_is_active'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='is_school_admin',
            field=models.BooleanField(default=False),
        ),
    ]
