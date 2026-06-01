# Task Manager App (Flutter)

A simple yet functional Task Management App built using Flutter.
This project is developed as part of an internship Week 3 assignment.
It demonstrates local storage, UI design, and optional Firebase integration.

FEATURES
- Add new tasks
- Delete tasks
- Mark tasks as complete/incomplete
- Data persistence using SharedPreferences
- Firebase Firestore integration (optional learning feature)
- Splash screen (bonus feature)
- Custom AppBar with action button and icons

PROJECT STRUCTURE
lib/
main.dart
splash_screen.dart
task_home.dart
task_model.dart
task_storage.dart
firebase_service.dart
firebase_note.dart

TECH STACK
- Flutter
- Dart
- SharedPreferences
- Firebase Core (optional)
- Cloud Firestore (optional)

FIREBASE INTEGRATION (OPTIONAL)
- Cloud Firestore for real-time database
- StreamBuilder for live updates
- Add/Delete/Update tasks in cloud

SETUP INSTRUCTIONS
1. Clone repository
git clone https://github.com/mano-2005/task_manager_app.git
2. Install dependencies
flutter pub get
3. Run the app
flutter run

DEPENDENCIES
- shared_preferences: ^2.5.5
- firebase_core: ^3.1.0
- cloud_firestore: ^5.0.0

TESTING
- Task creation works
- Task deletion updates UI
- Task completion persists
- Data persists after restart

FUTURE IMPROVEMENTS
- Firebase Authentication
- User-specific tasks
- Due dates and reminders
- Dark mode

AUTHOR
Internship Week 3 Task - Task Manager App

LICENSE
This project is for educational purposes only.
