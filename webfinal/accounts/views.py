import json
import re
from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.contrib import messages  
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from .models import ChatRoom, ChatMessage, Hackathon, InternshipResource, SdeSheet, VideoLecture
import os
import requests
from .models import Roadmap
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import logout
from allauth.socialaccount.models import SocialAccount
from allauth.socialaccount.providers.google.views import GoogleOAuth2Adapter
from allauth.socialaccount.providers.oauth2.client import OAuth2Error

# Index View
def index(request):
    return render(request, 'index.html')


# Contact View
def contact(request):
    return render(request, 'contact.html')


# Login View
def login_view(request):
    if request.method == 'POST':
        email = request.POST.get('email').strip()
        password = request.POST.get('password')

        if not email or not password:
            messages.error(request, 'Email and password cannot be empty.')
            return redirect('login')

        user = authenticate(request, username=email.lower(), password=password)  

        if user is not None:
            login(request, user)
            return redirect('index')  
        else:
            messages.error(request, 'Invalid email or password.')  

    return render(request, 'login.html')  

@login_required
def logout_view(request):
    """Logs out the user and redirects to the homepage."""
    logout(request)
    messages.success(request, "You have been logged out successfully.")
    return redirect("index")  # Redirect to homepage after logout

def google_callback(request):
    """Handle Google login callback"""
    try:
        data = json.loads(request.body)
        token = data.get("token")

        # Verify token with Google
        google_verify_url = f"https://oauth2.googleapis.com/tokeninfo?id_token={token}"
        response = requests.get(google_verify_url).json()

        if "email" in response:
            # Check if user exists in SocialAccount
            social_login = SocialAccount.objects.filter(uid=response["sub"]).first()
            if social_login:
                login(request, social_login.user)
                return JsonResponse({"success": True})

        return JsonResponse({"success": False, "error": "Invalid token"})

    except (json.JSONDecodeError, KeyError, OAuth2Error):
        return JsonResponse({"success": False, "error": "Invalid request"})


# Signup View
def signup(request):
    if request.method == 'POST':
        first_name = request.POST.get('firstname').strip()
        last_name = request.POST.get('lastname').strip()
        email = request.POST.get('email').strip()
        password = request.POST.get('password').strip()
        confirm_password = request.POST.get('confirm_password').strip()
        github = request.POST.get('github').strip()
        linkedin = request.POST.get('linkedin', '').strip()  

        if not first_name or not last_name or not email or not password or not confirm_password or not github:
            messages.error(request, 'All fields except LinkedIn are required.')
            return redirect('signup')

        try:
            validate_email(email)
        except ValidationError:
            messages.error(request, 'Enter a valid email address.')
            return redirect('signup')

        if User.objects.filter(email=email).exists():
            messages.error(request, 'Email already registered. Try logging in.')
            return redirect('signup')

        if len(password) < 8 or not re.search(r'[A-Z]', password) or not re.search(r'\d', password) or not re.search(r'[!@#$%^&*]', password):
            messages.error(request, 'Password must be at least 8 characters long, include 1 uppercase letter, 1 number, and 1 special character.')
            return redirect('signup')

        if password != confirm_password:
            messages.error(request, 'Passwords do not match.')
            return redirect('signup')

        user = User.objects.create_user(username=email.lower(), email=email.lower(), password=password)
        user.first_name = first_name
        user.last_name = last_name
        user.save()

        messages.success(request, 'Account created successfully. Please log in.')
        return redirect('login')

    return render(request, 'signup.html')


# Hackathons View
def hackathons(request):
    hackathon_list = Hackathon.objects.all().order_by("start_date")  
    return render(request, "hackathons.html", {"hackathon_list": hackathon_list})


# About View
def about(request):
    return render(request, 'about.html')


# FAQ View
def faq(request):
    return render(request, 'faq.html')


# Resources View
def resource(request):
    internship_resources = InternshipResource.objects.all()
    sde_sheets = SdeSheet.objects.all()
    video_lectures = VideoLecture.objects.all()

    return render(request, 'resource.html', {
        'internship_resources': internship_resources,
        'sde_sheets': sde_sheets,
        'video_lectures': video_lectures
    })


# Fetch all available chat rooms
@login_required
def chatrooms_list(request):
    all_rooms = ChatRoom.objects.all().values("name")  # Fetch room names only
    return JsonResponse({"rooms": list(all_rooms)})


# Chatroom View (Loads Initial Messages)
@login_required
def chatroom(request, room_name):
    room, created = ChatRoom.objects.get_or_create(name=room_name)
    messages = ChatMessage.objects.filter(room=room).order_by("timestamp")
    all_rooms = ChatRoom.objects.all()  

    return render(request, "chatroom.html", {
        "room_name": room_name,
        "messages": messages,
        "all_rooms": all_rooms  
    })


# Create New Chat Room (AJAX)
@csrf_exempt
@login_required
def create_room(request):
    if request.method == "POST":
        print("✅ Received POST request")  # Debugging

        try:
            data = json.loads(request.body)
            room_name = data.get("room_name", "").strip().lower()
            print(f"✅ Room Name: {room_name}")

            if not room_name:
                return JsonResponse({"success": False, "error": "Room name is required."}, status=400)

            if ChatRoom.objects.filter(name=room_name).exists():
                return JsonResponse({"success": False, "error": "Room already exists."}, status=400)

            ChatRoom.objects.create(name=room_name)
            print(f"✅ Room '{room_name}' created successfully!")
            return JsonResponse({"success": True, "room_name": room_name})

        except Exception as e:
            print(f"❌ Error: {str(e)}")
            return JsonResponse({"success": False, "error": "Server error"}, status=500)

    return JsonResponse({"success": False, "error": "Invalid request"}, status=400)


# Send Message (AJAX) - Stores Messages in Database with logged-in username
@csrf_exempt
@login_required
def send_message(request):
    if request.method == "POST":
        data = json.loads(request.body)
        room_name = data.get("room_name")
        message = data.get("message")

        if not room_name or not message:
            return JsonResponse({"success": False, "error": "Missing data"}, status=400)

        room, _ = ChatRoom.objects.get_or_create(name=room_name)
        chat_message = ChatMessage.objects.create(room=room, user=request.user, alias=request.user.username, message=message)

        return JsonResponse({
            "success": True,
            "message": chat_message.message,
            "alias": chat_message.alias,
            "timestamp": chat_message.timestamp.strftime("%Y-%m-%d %H:%M:%S"),
        })

    return JsonResponse({"success": False, "error": "Invalid request"}, status=400)


# Get Messages (AJAX) - Fetches Latest Messages
@login_required
def get_messages(request, room_name):
    room = get_object_or_404(ChatRoom, name=room_name)
    messages = ChatMessage.objects.filter(room=room).order_by("timestamp")

    return JsonResponse({
        "messages": [
            {
                "alias": msg.alias,
                "message": msg.message,
                "timestamp": msg.timestamp.strftime("%Y-%m-%d %H:%M:%S"),
            }
            for msg in messages
        ]
    })
def roadmap(request):
    return render(request, 'roadmap.html')


# Load API Keys from environment variables
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")
GOOGLE_SEARCH_API_KEY = os.getenv("GOOGLE_SEARCH_API_KEY")
GOOGLE_SEARCH_ENGINE_ID = os.getenv("GOOGLE_SEARCH_ENGINE_ID")


@login_required
def airoadmap(request):
    """Loads AI Roadmap Generator with all saved and tracked roadmaps."""
    user = request.user

    # ✅ Admin (`Ady`) sees ALL roadmaps; normal users see only their own
    if user.is_superuser and user.username == "Ady":
        saved_roadmaps = Roadmap.objects.all().order_by("-created_at")
    else:
        saved_roadmaps = Roadmap.objects.filter(user=user).order_by("-created_at")

    # ✅ Fetch the currently tracked roadmap
    tracked_roadmap = Roadmap.objects.filter(user=user, is_tracked=True).first()

    return render(
        request, "airoadmap.html",
        {"saved_roadmaps": saved_roadmaps, "tracked_roadmap": tracked_roadmap}
    )

# ✅ AI Roadmap Generator View
@login_required
def generate_ai_roadmap(request):
    if request.method == "POST":
        data = json.loads(request.body)
        user_input = data.get("career_goal", "").strip()

        if not user_input:
            return JsonResponse({"error": "Please enter a valid career goal."}, status=400)

        # ✅ 1️⃣ Generate Roadmap Using Google Gemini API
        roadmap_content = fetch_ai_roadmap(user_input)
        
        if not roadmap_content:
            return JsonResponse({"error": "Failed to generate roadmap. Try again later."}, status=500)

        # ✅ 2️⃣ Fetch Additional Resources Using Google Search API
        resources = fetch_google_resources(user_input)

        # ✅ 3️⃣ Format the Roadmap Properly
        formatted_roadmap = format_roadmap_html(roadmap_content, resources)

        return JsonResponse({"roadmap": formatted_roadmap})


# ✅ Fetch AI-generated roadmap from Google Gemini API
def fetch_ai_roadmap(user_input):
    api_url = "https://generativelanguage.googleapis.com/v1/models/gemini-1.5-pro:generateContent"
    headers = {"Content-Type": "application/json"}
    params = {"key": GEMINI_API_KEY}
    
    prompt = f"""
    Generate a step-by-step learning roadmap for {user_input} with:
    - **Estimated completion time**
    - **Essential topics**
    - **Recommended learning paths**
    - **Best free and paid resources**
    Format it in Markdown with proper **headings, lists, and highlights**.
    """

    payload = {"contents": [{"parts": [{"text": prompt}]}]}

    response = requests.post(api_url, headers=headers, params=params, json=payload)

    if response.status_code == 200:
        roadmap_data = response.json()
        return roadmap_data["candidates"][0]["content"]["parts"][0]["text"]
    
    return None


# ✅ Fetch top 3 learning resources using Google Custom Search API
def fetch_google_resources(query):
    search_url = "https://www.googleapis.com/customsearch/v1"
    params = {
        "key": GOOGLE_SEARCH_API_KEY,
        "cx": GOOGLE_SEARCH_ENGINE_ID,
        "q": f"best learning resources for {query}",
        "num": 3
    }

    response = requests.get(search_url, params=params)

    if response.status_code == 200:
        search_results = response.json().get("items", [])
        resources = [
            f'<li><a href="{item["link"]}" target="_blank">{item["title"]}</a></li>'
            for item in search_results
        ]
        return "<ul>" + "".join(resources) + "</ul>" if resources else ""
    
    return "<p>No additional resources found.</p>"


# ✅ Convert AI-generated Markdown roadmap into structured HTML
def format_roadmap_html(roadmap_text, resources):
    formatted_text = roadmap_text.replace("\n", "<br>")  # Convert line breaks
    formatted_text = re.sub(r"\*\*(.*?)\*\*", r"<strong>\1</strong>", formatted_text)  # Convert **bold** to <strong>
    formatted_text = re.sub(r"(\d+\.)", r"<br><b>\1</b>", formatted_text)  # Convert numbered lists

    # ✅ Add Google Search API resources at the end
    formatted_text += f"<h2>📚 Additional Learning Resources</h2>{resources}"

    return formatted_text

class CustomGoogleOAuth2Adapter(GoogleOAuth2Adapter):
    def complete_login(self, request, app, token, response, **kwargs):
        extra_data = response
        return self.get_provider().sociallogin_from_response(request, extra_data)

