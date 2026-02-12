import 'package:empat_school/models/task_2/song_item.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  final Set<SongItem> likedSongs;
  final void Function(SongItem song) onLikeToggle;

  const LibraryScreen({
    super.key,
    required this.likedSongs,
    required this.onLikeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return likedSongs.isEmpty
        ? Center(
            child: Text(
              'No liked songs yet.\nGo back to Home and like some songs!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          )
        : ListView.builder(
            itemCount: likedSongs.length,
            itemBuilder: (ctx, index) {
              final song = likedSongs.elementAt(index);
              return ListTile(
                title: Text(song.title),
                subtitle: Text(song.artist),
                trailing: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () => onLikeToggle(song),
                ),
              );
            },
          );
  }
}
