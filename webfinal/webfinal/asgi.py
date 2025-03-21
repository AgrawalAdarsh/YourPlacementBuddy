import os
import django
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack
from channels.layers import get_channel_layer
from accounts.routing import websocket_urlpatterns  # Import WebSocket routes

# Set Django settings module before initializing Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'webfinal.settings')

# Initialize Django
django.setup()

# ASGI application
application = ProtocolTypeRouter({
    "http": get_asgi_application(),  # Handles HTTP requests
    "websocket": AuthMiddlewareStack(  # Handles WebSocket connections
        URLRouter(websocket_urlpatterns)
    ),
})

# Ensure Django Channels layer is properly set up
channel_layer = get_channel_layer()
