import 'package:empat_school/models/task_2/song_item.dart';
import 'package:empat_school/widgets/task_2/columns_carousel_block.dart';
import 'package:empat_school/widgets/task_2/speed_dial_block.dart';
import 'package:flutter/material.dart';

class SliverContent extends StatelessWidget {
  final List<SongItem> allSongs;
  final Set<SongItem> likedSongs;
  final void Function(SongItem song) onLikeToggle;

  const SliverContent({
    super.key,
    required this.allSongs,
    required this.likedSongs,
    required this.onLikeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        spacing: 18,
        children: [
          ColumnsCarouselBlock(
            title: 'Quick picks',
            items: allSongs,
          ),
          SpeedDialBlock(
            allSongs: allSongs,
            likedSongs: likedSongs,
            onLikeToggle: onLikeToggle,
          ),
          ColumnsCarouselBlock(
            title: 'Covers and remixes',
            items: allSongs,
          ),
        ],
      ),
    );
  }
}
