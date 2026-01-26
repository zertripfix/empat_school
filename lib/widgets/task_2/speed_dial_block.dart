import 'package:empat_school/models/task_2/song_item.dart';
import 'package:flutter/material.dart';

class SpeedDialBlock extends StatelessWidget {
  final List<SongItem> items;

  SpeedDialBlock({
    super.key,
    required this.items,
  });

  static const int itemsPerPage = 9;

  final PageController _pageController = PageController();

  int get pageCount => (items.length / itemsPerPage).ceil();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        _header(),
        _content(),
      ],
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DENIS GAZHUR',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  Text(
                    'Speed dial',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return SizedBox(
      height: 3 * 120,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: _pageController,
        itemCount: pageCount,
        padEnds: false,
        itemBuilder: (ctx, indexPage) {
          final start = indexPage * itemsPerPage;
          final end = (start + itemsPerPage).clamp(0, items.length);
          final pageItems = items.sublist(start, end);
          return _grid(pageItems);
        },
      ),
    );
  }

  Widget _grid(List<SongItem> pageItems) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: pageItems.length,
        itemBuilder: (_, index) => _tile(pageItems[index]),
      ),
    );
  }

  Widget _tile(SongItem item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            item.coverPath,
            fit: BoxFit.cover,
          ),

          // Text background at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 48,
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

          // Text
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
