import json
from channels.generic.websocket import AsyncWebsocketConsumer
from django.contrib.auth.models import User
from .models import ChatRoom, ChatMessage

class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_name = self.scope["url_route"]["kwargs"]["room_name"]
        self.room_group_name = f"chat_{self.room_name}"

        user = self.scope.get("user")
        if user is None or not user.is_authenticated:
            await self.close()
            return

        await self.channel_layer.group_add(self.room_group_name, self.channel_name)
        await self.accept()

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(self.room_group_name, self.channel_name)

    async def receive(self, text_data):
        data = json.loads(text_data)
        user = self.scope.get("user")

        if user is None or user.is_anonymous:
            return

        alias = data.get("alias", user.username)
        message = data.get("message", "").strip()

        if not message:
            return

        room, _ = ChatRoom.objects.get_or_create(name=self.room_name)
        ChatMessage.objects.create(user=user, room=room, alias=alias, message=message)

        await self.channel_layer.group_send(
            self.room_group_name,
            {
                "type": "chat_message",
                "message": message,
                "user": user.username,
                "alias": alias,
            }
        )

    async def chat_message(self, event):
        await self.send(text_data=json.dumps({
            "alias": event["alias"],
            "message": event["message"]
        }))
