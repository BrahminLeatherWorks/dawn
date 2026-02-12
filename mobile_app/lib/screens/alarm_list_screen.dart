import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../core/alarm_store.dart';
import '../models/alarm.dart';
import '../models/wake_sound.dart';
import 'edit_alarm_screen.dart';
import 'ringing_screen.dart';

class AlarmListScreen extends ConsumerWidget {
  const AlarmListScreen({super.key});

  String _formatTime(BuildContext context, Alarm alarm) {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day, alarm.time.hour, alarm.time.minute);
    return DateFormat.jm().format(date);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alarms = ref.watch(alarmStoreProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Calm Wake')),
      body: alarms.isEmpty
          ? const Center(child: Text('No alarms yet'))
          : ListView.builder(
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                final alarm = alarms[index];
                final sound = kWakeSounds.firstWhere((s) => s.id == alarm.soundId);
                return Dismissible(
                  key: ValueKey(alarm.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => ref.read(alarmStoreProvider.notifier).deleteAlarm(alarm.id),
                  background: Container(
                    color: Theme.of(context).colorScheme.error,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(_formatTime(context, alarm), style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Text('${sound.name} • Fade ${alarm.fadeInSeconds}s • Snooze ${alarm.snoozeMinutes}m'),
                    leading: Switch(
                      value: alarm.enabled,
                      onChanged: (value) => ref.read(alarmStoreProvider.notifier).toggleEnabled(alarm.id, value),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => EditAlarmScreen(alarm: alarm)),
                      );
                    },
                    onLongPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => RingingScreen(
                            alarmLabel: _formatTime(context, alarm),
                            soundLabel: sound.name,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const EditAlarmScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
