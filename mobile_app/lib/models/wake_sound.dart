enum WakeSoundCategory { soundBath, nature, whiteNoise, gentleMusic }

class WakeSound {
  const WakeSound({
    required this.id,
    required this.name,
    required this.category,
    required this.assetPath,
  });

  final String id;
  final String name;
  final WakeSoundCategory category;
  final String assetPath;
}

const List<WakeSound> kWakeSounds = [
  WakeSound(
    id: 'bath_bowls',
    name: 'Crystal Bowls',
    category: WakeSoundCategory.soundBath,
    assetPath: 'assets/sounds/crystal_bowls.mp3',
  ),
  WakeSound(
    id: 'bath_drone',
    name: 'Soft Drone Bath',
    category: WakeSoundCategory.soundBath,
    assetPath: 'assets/sounds/soft_drone.mp3',
  ),
  WakeSound(
    id: 'nature_rain',
    name: 'Light Rain',
    category: WakeSoundCategory.nature,
    assetPath: 'assets/sounds/light_rain.mp3',
  ),
  WakeSound(
    id: 'nature_forest',
    name: 'Forest Morning',
    category: WakeSoundCategory.nature,
    assetPath: 'assets/sounds/forest_morning.mp3',
  ),
  WakeSound(
    id: 'noise_brown',
    name: 'Brown Noise',
    category: WakeSoundCategory.whiteNoise,
    assetPath: 'assets/sounds/brown_noise.mp3',
  ),
  WakeSound(
    id: 'music_piano',
    name: 'Gentle Piano',
    category: WakeSoundCategory.gentleMusic,
    assetPath: 'assets/sounds/gentle_piano.mp3',
  ),
];
