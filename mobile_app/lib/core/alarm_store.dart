import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/alarm.dart';

class AlarmStore extends StateNotifier<List<Alarm>> {
  AlarmStore()
      : super([
          Alarm(
            id: 'seed-1',
            time: const TimeOfDay(hour: 7, minute: 0),
            repeatDays: {1, 2, 3, 4, 5},
            soundId: 'bath_bowls',
            fadeInSeconds: 60,
            snoozeMinutes: 10,
          ),
        ]);

  void addAlarm(Alarm alarm) {
    state = [...state, alarm];
  }

  void updateAlarm(Alarm updated) {
    state = [for (final alarm in state) if (alarm.id == updated.id) updated else alarm];
  }

  void deleteAlarm(String id) {
    state = state.where((alarm) => alarm.id != id).toList();
  }

  void toggleEnabled(String id, bool enabled) {
    state = [
      for (final alarm in state)
        if (alarm.id == id) alarm.copyWith(enabled: enabled) else alarm,
    ];
  }
}

final alarmStoreProvider = StateNotifierProvider<AlarmStore, List<Alarm>>(
  (ref) => AlarmStore(),
);
