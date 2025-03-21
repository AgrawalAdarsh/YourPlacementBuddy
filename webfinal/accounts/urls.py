from django.urls import path
from . import views  

urlpatterns = [
    path('', views.index, name='index'),
    path('contact/', views.contact, name='contact'),
    path('login/', views.login_view, name='login'),
    path('signup/', views.signup, name='signup'),
    path('hackathons/', views.hackathons, name='hackathons'),
    path('about/', views.about, name='about'),
    path('faq/', views.faq, name='faq'),
    path('resource/', views.resource, name='resource'),
    path("logout/", views.logout_view, name="logout"),
    # Chatroom URLs
    path("chat/<str:room_name>/", views.chatroom, name="chatroom"),
    path("send_message/", views.send_message, name="send_message"),  
    path("get_messages/<str:room_name>/", views.get_messages, name="get_messages"),  
    path("create_room/", views.create_room, name="create_room"),  
    path("get_chat_rooms/", views.chatrooms_list, name="get_chat_rooms"), 
    
    # Roadmap URLs
    path("roadmap/", views.roadmap, name="roadmap"),
    path("airoadmap/", views.airoadmap, name="airoadmap"), 
    path("generate_ai_roadmap/", views.generate_ai_roadmap, name="generate_ai_roadmap"),
     path("auth/google/callback/", views.google_callback, name="google_callback"),
]
