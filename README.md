# ticket

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -O ./lib/core/localization --source-dir ./assets/languages
fluttergen
flutter pub run build_runner build --delete-conflicting-outputs  //conflict chiqganda ishlatiladi
flutter pub run build_runner build
