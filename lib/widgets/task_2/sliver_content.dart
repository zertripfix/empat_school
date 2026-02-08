import 'package:empat_school/mock/mock_data.dart';
import 'package:empat_school/widgets/task_2/columns_carousel_block.dart';
import 'package:empat_school/widgets/task_2/speed_dial_block.dart';
import 'package:flutter/material.dart';

class SliverContent extends StatelessWidget {
  const SliverContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        spacing: 18,
        children: [
          ColumnsCarouselBlock(
            title: 'Quick picks',
            items: mockSongs,
          ),
          SpeedDialBlock(
            items: mockSongs,
          ),
          ColumnsCarouselBlock(
            title: 'Covers and remixes',
            items: mockSongs,
          ),
        ],
      ),
    );
  }
}
