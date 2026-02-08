import 'package:empat_school/models/task_2/song_item.dart';
import 'package:flutter/material.dart';

class SongScreen extends StatelessWidget {
  final SongItem song;

  const SongScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Hero(
                tag: song.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    song.coverPath,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              song.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(song.artist, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
