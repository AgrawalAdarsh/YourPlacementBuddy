# from django.contrib.auth.models import AbstractUser
from django.db import models
from datetime import date
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model

# class CustomUser(AbstractUser):
#     groups = models.ManyToManyField(
#         "auth.Group",
#         related_name="customuser_set",
#         blank=True
#     )
#     user_permissions = models.ManyToManyField(
#         "auth.Permission",
#         related_name="customuser_set",
#         blank=True
#     )
class Hackathon(models.Model):
    name = models.CharField(max_length=255)
    link = models.URLField()
    start_date = models.DateField(default=date.today)  # Set default to today's date
    end_date = models.DateField(default=date.today)  # Set default to today's date
    location = models.CharField(max_length=255, null=True, blank=True)
    is_online = models.BooleanField(default=False)

    def __str__(self):
        return self.name
    
class Resource(models.Model):
    name = models.CharField(max_length=255)
    link = models.URLField()
    description = models.TextField()

    def __str__(self):
        return self.name

class InternshipResource(models.Model):
    title = models.CharField(max_length=255, default="General")
    link = models.URLField()
    
class SdeSheet(models.Model):
    name = models.CharField(max_length=255, default="General")
    link = models.URLField()

class VideoLecture(models.Model):
    title = models.CharField(max_length=255, default="General")
    link = models.URLField()

class ChatRoom(models.Model):
    name = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.name

class ChatMessage(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)  # Uses auth.User
    room = models.ForeignKey(ChatRoom, on_delete=models.CASCADE)
    alias = models.CharField(max_length=50, blank=True, null=True)
    message = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} ({self.alias if self.alias else self.user.username}): {self.message}"
    
class Roadmap(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)  # User-specific roadmaps
    title = models.CharField(max_length=255)
    steps = models.TextField()  # Store roadmap as JSON or HTML
    created_at = models.DateTimeField(auto_now_add=True)
    is_tracked = models.BooleanField(default=False)  # Track only one roadmap at a time

    def __str__(self):
        return f"{self.title} - {self.user.username}"