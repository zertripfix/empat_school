import 'package:empat_school/models/task_2/song_item.dart';
import 'package:flutter/material.dart';

class ColumnsCarouselBlock extends StatelessWidget {
  final List<SongItem> items;
  final String title;

  ColumnsCarouselBlock({
    super.key,
    required this.items,
    required this.title,
  });

  static const int itemsPerPage = 4;

  final PageController _pageController = PageController(
    viewportFraction: 0.90,
  );

  int get pageCount => (items.length / itemsPerPage).ceil();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        const SizedBox(height: 12),
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
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          TextButton(
            onPressed: () {},
            child: Text(
              'Play all',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return SizedBox(
      height: 4 * 72,
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: PageView.builder(
          clipBehavior: Clip.none,
          controller: _pageController,
          itemCount: pageCount,
          padEnds: false,
          itemBuilder: (ctx, indexPage) {
            final start = indexPage * itemsPerPage;
            final end = (start + itemsPerPage).clamp(0, items.length);
            final pageItems = items.sublist(start, end);
            return _column(pageItems);
          },
        ),
      ),
    );
  }

  Widget _column(List<SongItem> pageItems) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: pageItems.map(_tile).toList(),
      ),
    );
  }

  Widget _tile(SongItem item) {
    return Container(
      height: 72,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          //Cover
          Container(
            height: 56,
            width: 56,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: Image.asset(item.coverPath, fit: BoxFit.cover),
          ),

          //Title+Artist
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    item.artist,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          //Icon button
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
    );
  }
}
