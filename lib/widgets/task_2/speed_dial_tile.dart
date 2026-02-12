import 'package:empat_school/models/task_2/song_item.dart';
import 'package:flutter/material.dart';

class SpeedDialTile extends StatefulWidget {
  final SongItem song;
  final bool isLiked;
  final void Function(SongItem song) onLikeToggle;

  const SpeedDialTile({
    super.key,
    required this.song,
    required this.isLiked,
    required this.onLikeToggle,
  });

  @override
  State<SpeedDialTile> createState() => _SpeedDialTileState();
}

class _SpeedDialTileState extends State<SpeedDialTile> {
  bool _isPressed = false;
  bool _isHeroAnimating = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapCancel: () => setState(() => _isPressed = false),
      onTapUp: (_) async {
        setState(() {
          _isPressed = false;
          _isHeroAnimating = true;
        });
        await Navigator.pushNamed(
          context,
          '/song',
          arguments: {
            'song': widget.song,
            'isLiked': widget.isLiked,
            'onLikeToggle': widget.onLikeToggle,
          },
        );
        // Whait until hero animation is completed
        await Future.delayed(const Duration(milliseconds: 400));

        if (!mounted) return;
        setState(() => _isHeroAnimating = false);
      },

      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: _tileContent(widget.song),
      ),
    );
  }

  Widget _tileContent(SongItem song) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: song.id,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              song.coverPath,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 48,
          child: AnimatedOpacity(
            opacity: _isHeroAnimating ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withAlpha(190),
                  ],
                ),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: AnimatedOpacity(
            opacity: _isHeroAnimating ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: Text(
              song.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
