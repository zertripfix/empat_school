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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
