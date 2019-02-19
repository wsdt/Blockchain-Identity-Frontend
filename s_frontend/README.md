# s_frontend

Bund Prototyp - Frontend

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

# How to run:
```
flutter get
flutter build
```
May the android build will fail. Please consider to open s_frontend/android with android Studio. Run gradle build again. May the build will fail again. To fix that issue. Please remove the @Nullable import and annotation in this particular file:

`~/flutter/.pub-cache/hosted/pub.dartlang.org/simple_auth_flutter-2.0.1/android/src/main/java/clancey/simpleauth/simpleauthflutter/SimpleAuthCallbackActivity.java`

