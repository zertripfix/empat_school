import 'package:empat_school/models/task_2/song_item.dart';
import 'package:empat_school/widgets/task_2/speed_dial_tile.dart';
import 'package:flutter/material.dart';

class SpeedDialBlock extends StatefulWidget {
  final List<SongItem> items;

  const SpeedDialBlock({super.key, required this.items});

  @override
  State<SpeedDialBlock> createState() => _SpeedDialBlockState();
}

class _SpeedDialBlockState extends State<SpeedDialBlock> {
  static const int itemsPerPage = 9;

  final PageController _pageController = PageController();

  _SpeedDialBlockState();

  int get pageCount => (widget.items.length / itemsPerPage).ceil();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        _header(),
        _content(context),
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

  Widget _content(BuildContext context) {
    return SizedBox(
      height: 3 * 120,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: _pageController,
        itemCount: pageCount,
        padEnds: false,
        itemBuilder: (ctx, indexPage) {
          final start = indexPage * itemsPerPage;
          final end = (start + itemsPerPage).clamp(0, widget.items.length);
          final pageItems = widget.items.sublist(start, end);
          return _grid(context, pageItems);
        },
      ),
    );
  }

  Widget _grid(BuildContext context, List<SongItem> pageItems) {
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
        itemBuilder: (_, index) => SpeedDialTile(song: pageItems[index]),
      ),
    );
  }
}
