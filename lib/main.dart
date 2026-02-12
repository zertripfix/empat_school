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
        final args = settings.arguments!;
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const HomeScreen());
          case '/song':
            if (args is Map<String, dynamic>) {
              final song = args['song'] as SongItem;
              final isLiked = args['isLiked'] as bool;
              final onLikeToggle = args['onLikeToggle'] as void Function(SongItem);
              return MaterialPageRoute(
                builder: (_) => SongScreen(
                  song: song,
                  isLiked: isLiked,
                  onLikeToggle: onLikeToggle,
                ),
              );
            }
          default:
            return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
        return null;
      },
    );
  }
}
