import 'package:empat_school/screens/home_screen/home_screen.dart';
import 'package:empat_school/screens/task_2/song_screen.dart';
import 'package:flutter/material.dart';

import 'models/task_2/song_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empat shool',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Color.fromRGBO(172, 214, 184, 1)),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const HomeScreen());
          case '/song':
            final args = settings.arguments as SongItem?;
            return MaterialPageRoute(
              builder: (_) => SongScreen(song: args!),
            );
          default:
            return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
      },
    );
  }
}
