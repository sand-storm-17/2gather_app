# 🎉 2gather – Social Media Event Management App

**2gather** is a Flutter-based social media application designed to create, discover, and join public or private events. It also enables real-time chatting and notifications, helping users connect over shared interests and local happenings.

---

## 🚀 Features

- 📅 Create, edit, and manage public/private events
- 🧭 Discover events based on location and interest
- 💬 Real-time group & private chat functionality
- 🔔 Event-based notifications and reminders
- 🗺️ Google Maps integration for event location view
- 📤 RSVP, comment, and interact with event attendees
- 📥 Offline caching with Hive for seamless experience

---

## 🛠️ Tech Stack

| Category         | Technology                           |
|------------------|---------------------------------------|
| **Framework**    | Flutter (Material 3)                 |
| **State Mgmt**   | BLoC (flutter_bloc)                  |
| **Database**     | Firebase Firestore, Hive (offline)   |
| **Networking**   | Dio                                  |
| **Serialization**| json_serializable                    |
| **Authentication**| Firebase Auth                       |
| **Notifications**| Firebase Cloud Messaging (FCM)       |
| **Maps**         | Google Maps Flutter SDK              |

---

## 📸 Screenshots

![sandeep](https://github.com/user-attachments/assets/438ca45d-86b8-4c3f-9991-11f4a4b0ee8e)


## 🧑‍💻 Getting Started

### Prerequisites

- Flutter SDK (v3.10 or higher recommended)
- Firebase Project setup with Firestore, Auth, and FCM enabled
- Google Maps API Key

### Installation

```bash
git clone https://github.com/yourusername/2gather.git
cd 2gather
flutter pub get
