import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/alarm_store.dart';
import '../models/alarm.dart';
import '../models/wake_sound.dart';
import '../screens/sound_picker_screen.dart';
import '../widgets/day_selector.dart';

class EditAlarmScreen extends ConsumerStatefulWidget {
  const EditAlarmScreen({super.key, this.alarm});

  final Alarm? alarm;

  @override
  ConsumerState<EditAlarmScreen> createState() => _EditAlarmScreenState();
}

class _EditAlarmScreenState extends ConsumerState<EditAlarmScreen> {
  late TimeOfDay _time;
  late Set<int> _repeatDays;
  late String _soundId;
  late int _fadeInSeconds;
  late int _snoozeMinutes;

  @override
  void initState() {
    super.initState();
    _time = widget.alarm?.time ?? const TimeOfDay(hour: 7, minute: 0);
    _repeatDays = widget.alarm?.repeatDays ?? {1, 2, 3, 4, 5};
    _soundId = widget.alarm?.soundId ?? kWakeSounds.first.id;
    _fadeInSeconds = widget.alarm?.fadeInSeconds ?? 60;
    _snoozeMinutes = widget.alarm?.snoozeMinutes ?? 10;
  }

  Future<void> _pickTime() async {
    final selected = await showTimePicker(context: context, initialTime: _time);
    if (selected != null) {
      setState(() => _time = selected);
    }
  }

  Future<void> _pickSound() async {
    final selectedId = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => SoundPickerScreen(selectedSoundId: _soundId),
      ),
    );
    if (selectedId != null) {
      setState(() => _soundId = selectedId);
    }
  }

  void _save() {
    final alarm = Alarm(
      id: widget.alarm?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      time: _time,
      repeatDays: _repeatDays,
      soundId: _soundId,
      fadeInSeconds: _fadeInSeconds,
      snoozeMinutes: _snoozeMinutes,
      enabled: widget.alarm?.enabled ?? true,
    );

    if (widget.alarm == null) {
      ref.read(alarmStoreProvider.notifier).addAlarm(alarm);
    } else {
      ref.read(alarmStoreProvider.notifier).updateAlarm(alarm);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final sound = kWakeSounds.firstWhere((s) => s.id == _soundId);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.alarm == null ? 'New Alarm' : 'Edit Alarm'),
        actions: [
          TextButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Time'),
            subtitle: Text(_time.format(context)),
            trailing: const Icon(Icons.schedule),
            onTap: _pickTime,
          ),
          const SizedBox(height: 16),
          const Text('Repeat Days'),
          const SizedBox(height: 8),
          DaySelector(
            selectedDays: _repeatDays,
            onChanged: (next) => setState(() => _repeatDays = next),
          ),
          const SizedBox(height: 20),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Wake Sound'),
            subtitle: Text(sound.name),
            trailing: const Icon(Icons.music_note),
            onTap: _pickSound,
          ),
          const SizedBox(height: 16),
          Text('Fade In: ${_fadeInSeconds}s'),
          Slider(
            value: _fadeInSeconds.toDouble(),
            min: 30,
            max: 180,
            divisions: 5,
            label: '$_fadeInSeconds s',
            onChanged: (value) => setState(() => _fadeInSeconds = value.toInt()),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            value: _snoozeMinutes,
            decoration: const InputDecoration(labelText: 'Snooze Length'),
            items: const [5, 10, 15]
                .map((value) => DropdownMenuItem(value: value, child: Text('$value minutes')))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _snoozeMinutes = value);
              }
            },
          ),
        ],
      ),
    );
  }
}
