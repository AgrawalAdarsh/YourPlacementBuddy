# YourPlacementBuddy
- YourPlacementBuddy is a roadmap generator for college placements, integrating AI-based roadmap generation, tracking, and resources.

This is a comprehensive Django-based web application developed as a final semester project. It includes user authentication with Google OAuth, resource sharing for students, hackathon listings, roadmaps, internships, and chatrooms for collaborative discussion.

## Features

- **User Authentication**
  - Django Allauth with Google OAuth login
- **Resource Management**
  - Add and view roadmaps, video lectures, SDE sheets, and internship resources
- **Hackathon Tracker**
  - List and manage hackathon events
- **Real-time Chat**
  - Chatrooms with WebSocket support via Django Channels and Redis
- **Admin Interface**
  - Manage users, resources, and hackathons via Django Admin Panel

## Tech Stack

- **Backend**: Django 5.1.6
- **Frontend**: HTML, CSS, JavaScript (Bootstrap)
- **Database**: MySQL
- **Authentication**: Django Allauth (Google OAuth2)
- **Real-time Communication**: Django Channels + Redis
- **Hosting/Local**: XAMPP (MySQL), WSL/Windows Environment

## Project Structure

WebFinal Project/ ├── accounts/ │ ├── templates/ │ ├── static/ │ ├── migrations/ │ ├── views.py │ ├── models.py │ ├── urls.py │ ├── forms.py ├── webfinal/ │ ├── settings.py │ ├── urls.py │ ├── asgi.py │ ├── wsgi.py ├── key.env ├── db/ │ └── backup.sql ├── manage.py


## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/WebFinal-Project.git
cd WebFinal-Project
```
### 2. Create and Activate Virtual Environment
```
python -m venv venv
source venv/bin/activate  # For Windows: venv\Scripts\activate
```
### 3. Install Requirements
```
pip install -r requirements.txt
```
### 4. Set Environmant Variables
- Create a **key.env** file in the root and add:
```
GEMINI_API_KEY=your_key
GOOGLE_SEARCH_API_KEY=your_key
GOOGLE_SEARCH_ENGINE_ID=your_id
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
```
### 5. Set Up MySQL Database
- Make sure MySQL is running (via XAMPP or WSL)
- Import the database:
```
mysql -u root -p webproject < accounts/db/backup.sql
```
### 6. Run Migrations and Start Server
```
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```
### 7. Start Redis Server
- Ensure Redis is running (if using WSL):
```
redis-server
```

## Contributors
- Adarsh Agrawal (Frontend and Backend Complete)

## License
- This project is developed for academic purposes
