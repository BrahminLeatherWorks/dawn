import 'package:flutter/material.dart';

import '../models/wake_sound.dart';

class SoundPickerScreen extends StatelessWidget {
  const SoundPickerScreen({
    super.key,
    required this.selectedSoundId,
  });

  final String selectedSoundId;

  String _categoryLabel(WakeSoundCategory category) {
    switch (category) {
      case WakeSoundCategory.soundBath:
        return 'Sound Bath';
      case WakeSoundCategory.nature:
        return 'Nature';
      case WakeSoundCategory.whiteNoise:
        return 'White Noise';
      case WakeSoundCategory.gentleMusic:
        return 'Gentle Music';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick Wake Sound')),
      body: ListView.builder(
        itemCount: kWakeSounds.length,
        itemBuilder: (context, index) {
          final sound = kWakeSounds[index];
          final selected = sound.id == selectedSoundId;
          return ListTile(
            title: Text(sound.name),
            subtitle: Text(_categoryLabel(sound.category)),
            trailing: selected ? const Icon(Icons.check_circle) : null,
            onTap: () => Navigator.pop(context, sound.id),
          );
        },
      ),
    );
  }
}
