import 'package:flutter/material.dart';

class Alarm {
  Alarm({
    required this.id,
    required this.time,
    required this.repeatDays,
    required this.soundId,
    required this.fadeInSeconds,
    required this.snoozeMinutes,
    this.enabled = true,
  });

  final String id;
  final TimeOfDay time;
  final Set<int> repeatDays;
  final String soundId;
  final int fadeInSeconds;
  final int snoozeMinutes;
  final bool enabled;

  Alarm copyWith({
    String? id,
    TimeOfDay? time,
    Set<int>? repeatDays,
    String? soundId,
    int? fadeInSeconds,
    int? snoozeMinutes,
    bool? enabled,
  }) {
    return Alarm(
      id: id ?? this.id,
      time: time ?? this.time,
      repeatDays: repeatDays ?? this.repeatDays,
      soundId: soundId ?? this.soundId,
      fadeInSeconds: fadeInSeconds ?? this.fadeInSeconds,
      snoozeMinutes: snoozeMinutes ?? this.snoozeMinutes,
      enabled: enabled ?? this.enabled,
    );
  }
}
