from django.contrib import admin
# from .models import CustomUser
from .models import Hackathon
from .models import InternshipResource, SdeSheet, VideoLecture, ChatRoom, ChatMessage
from .models import Roadmap
# admin.site.register(CustomUser)
admin.site.register(Hackathon)
admin.site.register(InternshipResource)
admin.site.register(SdeSheet)
admin.site.register(VideoLecture)
admin.site.register(ChatRoom)
admin.site.register(ChatMessage)
@admin.register(Roadmap)
class RoadmapAdmin(admin.ModelAdmin):
    list_display = ("title", "user", "steps", "created_at", "is_tracked")
    search_fields = ("title", "user__username")
