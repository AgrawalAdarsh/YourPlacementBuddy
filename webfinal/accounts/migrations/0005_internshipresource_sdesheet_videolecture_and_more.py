# Generated by Django 5.1.6 on 2025-02-20 11:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        (
            "accounts",
            "0004_delete_blog_delete_roadmap_remove_resource_subject_and_more",
        ),
    ]

    operations = [
        migrations.CreateModel(
            name="InternshipResource",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("title", models.CharField(default="General", max_length=255)),
                ("link", models.URLField()),
            ],
        ),
        migrations.CreateModel(
            name="SdeSheet",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(default="General", max_length=255)),
                ("link", models.URLField()),
            ],
        ),
        migrations.CreateModel(
            name="VideoLecture",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("title", models.CharField(default="General", max_length=255)),
                ("link", models.URLField()),
            ],
        ),
        migrations.RemoveField(
            model_name="resource",
            name="category",
        ),
        migrations.RemoveField(
            model_name="resource",
            name="title",
        ),
        migrations.AddField(
            model_name="resource",
            name="description",
            field=models.TextField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name="resource",
            name="name",
            field=models.CharField(default=1, max_length=255),
            preserve_default=False,
        ),
    ]
