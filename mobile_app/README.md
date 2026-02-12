# Calm Wake (Flutter)

Starter implementation for the iOS + Android soft-music alarm app.

## What's included
- Alarm list screen
- Create/edit alarm screen
- Soft sound picker (sound bath, nature, white noise, gentle music)
- Fade-in and snooze configuration
- Simple ringing screen UI
- In-memory storage layer (easy to swap with Hive/Isar)

## Run
```bash
cd mobile_app
flutter pub get
flutter run
```

## Notes
This is an MVP scaffold. Platform-specific exact alarm reliability should be added next (Android exact alarm permissions + iOS notification behaviors).
