# Generated by Django 5.1.6 on 2025-03-20 02:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("accounts", "0009_roadmap"),
    ]

    operations = [
        migrations.AddField(
            model_name="roadmap",
            name="is_tracked",
            field=models.BooleanField(default=False),
        ),
    ]
