import 'package:flutter/material.dart';

class RingingScreen extends StatelessWidget {
  const RingingScreen({super.key, required this.alarmLabel, required this.soundLabel});

  final String alarmLabel;
  final String soundLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.alarm, size: 80),
              const SizedBox(height: 24),
              Text(alarmLabel, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text('Now playing: $soundLabel'),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.snooze),
                label: const Text('Snooze'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.stop),
                label: const Text('Stop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
