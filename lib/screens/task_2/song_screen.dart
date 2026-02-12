import 'package:empat_school/models/task_2/song_item.dart';
import 'package:flutter/material.dart';

class SongScreen extends StatefulWidget {
  final SongItem song;
  final void Function(SongItem song) onLikeToggle;
  final bool isLiked;

  const SongScreen({
    super.key,
    required this.song,
    required this.isLiked,
    required this.onLikeToggle,
  });

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late bool localIsLiked;

  @override
  void initState() {
    super.initState();
    localIsLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.song.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.song.coverPath,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.song.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Text(widget.song.artist, style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                widget.onLikeToggle(widget.song);
                setState(() => localIsLiked = !localIsLiked);
              },
              icon: Icon(
                localIsLiked ? Icons.favorite : Icons.favorite_border,
              ),
              label: Text(localIsLiked ? 'Unlike' : 'Like'),
            ),
          ],
        ),
      ),
    );
  }
}
