# Calm Wake Alarm App (iOS + Android) — MVP Plan

## 1) Product idea
Build a cross-platform alarm app that wakes users like a normal alarm, but starts with soft, customizable audio (e.g., sound bath, ambient chimes, nature, light piano).

## 2) Core user flow
1. User opens app and taps **New Alarm**.
2. User sets time and repeat days.
3. User chooses a **Wake Sound** from a curated soft-sound library.
4. User sets fade-in duration (for gentle wake-up).
5. Alarm rings at scheduled time with gradual volume increase.
6. User can snooze or stop.

## 3) MVP features
- Alarm creation/edit/delete.
- Repeat schedules (weekdays/custom days).
- Soft audio picker with categories:
  - Sound bath
  - Nature
  - White noise
  - Gentle music
- Volume fade-in (e.g., 30s, 60s, 120s).
- Snooze settings (5/10/15 min).
- Basic history: “last alarm dismissed at …”.

## 4) Technical recommendation
Use **Flutter** for one codebase targeting iOS and Android.

### Why Flutter
- Fast cross-platform delivery.
- Good audio/plugin support.
- Polished UI on both platforms.

### Suggested stack
- State: Riverpod (or Provider for simplicity).
- Local DB: Hive/Isar.
- Audio playback: just_audio.
- Notifications + alarm scheduling:
  - Android: android_alarm_manager_plus + notifications
  - iOS: flutter_local_notifications (with proper permissions).

## 5) Platform caveats
- iOS has strict background execution behavior; alarms should rely on local notifications and approved audio behavior.
- Android power-saving modes can delay tasks; handle exact alarm permissions for reliability.
- Use pre-bundled offline sounds in MVP to avoid network dependency.

## 6) Data model (simple)
- `Alarm`
  - id
  - hour/minute
  - repeatDays[]
  - soundId
  - fadeInSeconds
  - snoozeMinutes
  - enabled
- `Sound`
  - id
  - name
  - category
  - filePath

## 7) MVP screens
- Onboarding (permissions + quick explanation)
- Alarm List
- Create/Edit Alarm
- Sound Picker
- Ringing Screen (snooze/stop)
- Settings (default snooze, default fade)

## 8) 2-week build outline
### Week 1
- App skeleton + navigation
- Alarm CRUD + local storage
- Permissions + scheduling basics
- Sound library and picker UI

### Week 2
- Fade-in playback
- Ringing screen UX
- Reliability testing on real devices
- Polish + app icons + store prep

## 9) Nice-to-have after MVP
- Smart wake window (within a range)
- Bedtime reminders
- Sleep sound timer
- Premium sound packs

## 10) Definition of done for first release
- Alarm reliably fires on both iOS and Android test devices.
- User can choose soft sound and fade-in behavior.
- Snooze/stop actions are responsive.
- No crashes in common flows (create/edit/delete/ring).
