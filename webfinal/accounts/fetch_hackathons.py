import os
import django
import requests
import re
from datetime import datetime, date
from accounts.models import Hackathon

# Setup Django environment
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "webfinal.settings")
django.setup()

# API Endpoint
DEVPOST_API_URL = "https://devpost.com/api/hackathons"

### Fetch Devpost Hackathons ###
def parse_devpost_dates(date_text):
    """Extracts start and end dates from Devpost format (e.g., 'Feb 10 - Mar 09, 2025')"""
    match = re.search(r"([A-Za-z]{3} \d{1,2}) - ([A-Za-z]{3} \d{1,2}), (\d{4})", date_text)
    if match:
        start_str, end_str, year = match.groups()
        try:
            start_date = datetime.strptime(f"{start_str} {year}", "%b %d %Y").date()
            end_date = datetime.strptime(f"{end_str} {year}", "%b %d %Y").date()
            return start_date, end_date
        except ValueError:
            pass
    return date.today(), date.today()  # Default to today if parsing fails

def fetch_devpost_hackathons():
    """Fetch hackathons from Devpost API"""
    response = requests.get(DEVPOST_API_URL)
    if response.status_code != 200:
        print("❌ Devpost API failed:", response.status_code, response.text)
        return []

    try:
        data = response.json()
        if "hackathons" not in data:
            print("⚠ Devpost API returned unexpected format:", data)
            return []
        
        data = data["hackathons"]
    except ValueError:
        print("❌ Devpost API returned invalid JSON")
        return []

    hackathons = []
    for event in data:
        start_date, end_date = parse_devpost_dates(event.get("submission_period_dates", ""))

        hackathons.append({
            "name": event.get("title", "Unknown Hackathon"),
            "link": event.get("url", "#"),
            "start_date": start_date,
            "end_date": end_date,
            "location": event.get("displayed_location", {}).get("location", "Online"),
            "is_online": "Online" in event.get("displayed_location", {}).get("location", "")
        })

    print(f"✅ Fetched {len(hackathons)} hackathons from Devpost API")
    return hackathons

### Save Only New Hackathons to Database ###
def save_scraped_hackathons():
    """Fetch and add only new hackathons to the database without modifying old ones"""
    hackathons = fetch_devpost_hackathons()

    if hackathons:
        existing_links = set(Hackathon.objects.values_list("link", flat=True))  # Get existing links
        new_hackathons = [event for event in hackathons if event["link"] not in existing_links]  # Only new entries
        
        if new_hackathons:
            Hackathon.objects.bulk_create([
                Hackathon(
                    name=event["name"],
                    link=event["link"],
                    start_date=event["start_date"],
                    end_date=event["end_date"],
                    location=event["location"],
                    is_online=event["is_online"]
                )
                for event in new_hackathons
            ])
            print(f"✅ Added {len(new_hackathons)} new hackathons to the database")
        else:
            print("⚠ No new hackathons found, database remains unchanged")

if __name__ == "__main__":
    save_scraped_hackathons()
