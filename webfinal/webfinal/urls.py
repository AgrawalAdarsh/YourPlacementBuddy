from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('accounts.urls')),  # All routes handled by accounts
    path('accounts/', include('allauth.urls')),  # Google login and other auth URLs
]
