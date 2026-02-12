import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/alarm_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: CalmWakeApp()));
}

class CalmWakeApp extends StatelessWidget {
  const CalmWakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calm Wake',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const AlarmListScreen(),
    );
  }
}
