class SongItem {
  static int _idCounter = 0;
  final int id;
  final String title;
  final String artist;
  final String coverPath;

  SongItem({
    required this.title,
    required this.artist,
    required this.coverPath,
  }) : id = ++_idCounter;
}
