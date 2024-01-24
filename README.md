# chatapp

# Flutter Firebase Chat App

## Overview

This Flutter Firebase Chat App is a real-time messaging application that allows users to send and receive messages instantly. The app is built using Flutter for the frontend and Firebase for the backend, providing a scalable and reliable solution for implementing chat functionality.

## Features

- Real-time messaging: Send and receive messages in real-time.
- User authentication: Authenticate users with Firebase authentication.
- Cloud Firestore: Store and sync data in real-time with Firebase Cloud Firestore.
- text messages: Support for text messages.

## Prerequisites

Before running the app, make sure you have the following installed:

- Flutter: Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install) to install Flutter.
- Firebase: Set up a Firebase project and obtain the necessary credentials. Follow the [Firebase documentation](https://firebase.google.com/docs/flutter/setup) to integrate Firebase with your Flutter app.

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/sumitparariyaa/chatapp.git
   ```

2. Navigate to the project directory:

   ```bash
   cd chatapp
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Add your Firebase configuration:

    - Replace the existing `google-services.json` file (for Android) and `GoogleService-Info.plist` file (for iOS) in the `android/app` and `ios/Runner` directories with your own files from the Firebase console.

5. Run the app:

   ```bash
   flutter run
   ```

   This will launch the app on your connected device or emulator.

## Usage

- Sign up: Create a new account or sign in with an existing one.
- Start a conversation: Choose a user from the list their username to start a chat.
- Send messages: Type your message and press the send button.

## Folder Structure

```plaintext
chatapp/
|-- lib/
|   |-- main.dart
|   |-- mychatapp.dart
|   |-- models/
|   |   |-- message_model.dart
|   |-- screens/
|   |   |-- HomeScreen.dart
|   |   |-- ChatScreen.dart
|   |   |-- LoginScreen.dart
|   |   |-- RegisterScreen.dart
|   |   |-- SettingScreen.dart
|   |-- services/
|   |   |-- auth/
|   |   |   |-- authGate.dart
|   |   |   |-- authservice.dart
|   |   |   |-- registerorlogin.dart
|   |   |-- chats/
|   |   |   |-- chat_service.dart
|   |-- theme/
|   |   |-- darkmode.dart
|   |   |-- lightmode.dart
|   |   |-- themeprovider.dart
|   |-- widgets/
|   |   |-- chat_outline.dart
|   |   |-- mybutton.dart
|   |   |-- mydrawer.dart
|   |   |-- mytextfield.dart
|   |   |-- usertile.dart
|-- android/
|-- ios/
|-- ...
|-- pubspec.yaml
|-- README.md
```

---

Happy chatting! 🚀