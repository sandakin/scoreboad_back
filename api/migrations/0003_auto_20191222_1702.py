# Generated by Django 3.0.1 on 2019-12-22 17:02

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('api', '0002_userstate'),
    ]

    operations = [
        migrations.AlterField(
            model_name='staff',
            name='user',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='staff', to=settings.AUTH_USER_MODEL),
        ),
    ]