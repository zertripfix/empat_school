import 'package:empat_school/models/task_2/song_item.dart';
import 'package:empat_school/widgets/task_2/columns_carousel_block.dart';
import 'package:empat_school/widgets/task_2/speed_dial_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondTaskScreen extends StatelessWidget {
  const SecondTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            _header(),
            _content(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.white),
          fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(Icons.explore_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Library',
              icon: Icon(Icons.bookmark_outline),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _content() {
    return SliverToBoxAdapter(
      child: Column(
        spacing: 18,
        children: [
          ColumnsCarouselBlock(
            title: 'Quick picks',
            items: [
              SongItem(
                title: 'Save My Soul',
                artist: 'Big Bad Voodoo Daddy',
                coverPath: 'assets/images/savemysoul.png',
              ),
              SongItem(
                title: 'Schism',
                artist: 'TOOL',
                coverPath: 'assets/images/tool.png',
              ),
              SongItem(
                title: 'A Nine days\' Wonder',
                artist: 'Akeboshi',
                coverPath: 'assets/images/akeboshi.png',
              ),
              SongItem(
                title: 'Judith',
                artist: 'A Perfect Circle',
                coverPath: 'assets/images/aperfectcircle.png',
              ),
              SongItem(
                title: 'Same Damn Life',
                artist: 'Seether',
                coverPath: 'assets/images/seether.png',
              ),
              SongItem(
                title: 'Ten Tonne Skeleton',
                artist: 'Royal Blood',
                coverPath: 'assets/images/royalblood.png',
              ),
              SongItem(
                title: 'The Red',
                artist: 'Chevelle',
                coverPath: 'assets/images/chevelle.png',
              ),
              SongItem(
                title: 'Marmalade',
                artist: 'System Of A Down',
                coverPath: 'assets/images/soad.png',
              ),
            ],
          ),
          SpeedDialBlock(
            items: [
              SongItem(
                title: 'Schism',
                artist: 'TOOL',
                coverPath: 'assets/images/tool.png',
              ),
              SongItem(
                title: 'A Nine days\' Wonder',
                artist: 'Akeboshi',
                coverPath: 'assets/images/akeboshi.png',
              ),
              SongItem(
                title: 'Judith',
                artist: 'A Perfect Circle',
                coverPath: 'assets/images/aperfectcircle.png',
              ),
              SongItem(
                title: 'Same Damn Life',
                artist: 'Seether',
                coverPath: 'assets/images/seether.png',
              ),
              SongItem(
                title: 'Ten Tonne Skeleton',
                artist: 'Royal Blood',
                coverPath: 'assets/images/royalblood.png',
              ),
              SongItem(
                title: 'Save My Soul',
                artist: 'Big Bad Voodoo Daddy',
                coverPath: 'assets/images/savemysoul.png',
              ),
              SongItem(
                title: 'Schism',
                artist: 'TOOL',
                coverPath: 'assets/images/tool.png',
              ),
              SongItem(
                title: 'A Nine days\' Wonder',
                artist: 'Akeboshi',
                coverPath: 'assets/images/akeboshi.png',
              ),
              SongItem(
                title: 'Judith',
                artist: 'A Perfect Circle',
                coverPath: 'assets/images/aperfectcircle.png',
              ),
              SongItem(
                title: 'Same Damn Life',
                artist: 'Seether',
                coverPath: 'assets/images/seether.png',
              ),
              SongItem(
                title: 'Ten Tonne Skeleton',
                artist: 'Royal Blood',
                coverPath: 'assets/images/royalblood.png',
              ),
              SongItem(
                title: 'The Red',
                artist: 'Chevelle',
                coverPath: 'assets/images/chevelle.png',
              ),
              SongItem(
                title: 'Marmalade',
                artist: 'System Of A Down',
                coverPath: 'assets/images/soad.png',
              ),
            ],
          ),
          ColumnsCarouselBlock(
            title: 'Covers and remixes',
            items: [
              SongItem(
                title: 'Same Damn Life',
                artist: 'Seether',
                coverPath: 'assets/images/seether.png',
              ),
              SongItem(
                title: 'Schism',
                artist: 'TOOL',
                coverPath: 'assets/images/tool.png',
              ),
              SongItem(
                title: 'Save My Soul',
                artist: 'Big Bad Voodoo Daddy',
                coverPath: 'assets/images/savemysoul.png',
              ),
              SongItem(
                title: 'A Nine days\' Wonder',
                artist: 'Akeboshi',
                coverPath: 'assets/images/akeboshi.png',
              ),
              SongItem(
                title: 'The Red',
                artist: 'Chevelle',
                coverPath: 'assets/images/chevelle.png',
              ),
              SongItem(
                title: 'Judith',
                artist: 'A Perfect Circle',
                coverPath: 'assets/images/aperfectcircle.png',
              ),
              SongItem(
                title: 'Ten Tonne Skeleton',
                artist: 'Royal Blood',
                coverPath: 'assets/images/royalblood.png',
              ),
              SongItem(
                title: 'Marmalade',
                artist: 'System Of A Down',
                coverPath: 'assets/images/soad.png',
              ),
            ],
          ),
        ],
      ),
    );
  }

  SliverAppBar _header() {
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      toolbarHeight: 0,
      collapsedHeight: 1,
      backgroundColor: Colors.black,

      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(
              'assets/images/header_background.png',
              fit: BoxFit.cover,
            ),
            // Dark gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.8, 1],
                  colors: [
                    Colors.black.withAlpha(150),
                    Colors.black.withAlpha(200),
                    Colors.black.withAlpha(250),
                  ],
                ),
              ),
            ),

            //Header content
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  _headerTopRow(),
                  const SizedBox(height: 24),
                  _headerChipsRow(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerTopRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 24,
            child: SvgPicture.asset('assets/images/ym_logo.svg'),
          ),
          Row(
            children: [
              Icon(Icons.notifications_none_rounded),
              SizedBox(width: 16),
              Icon(Icons.search_rounded),
              SizedBox(width: 16),
              CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerChipsRow() {
    return SizedBox(
      height: 36,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _headerChip('Podcasts'),
            _headerChip('Energise'),
            _headerChip('Relax'),
            _headerChip('Feel good'),
            _headerChip('Party'),
            _headerChip('Commute'),
            _headerChip('Workout'),
            _headerChip('Romance'),
            _headerChip('Sad'),
            _headerChip('Focus'),
            _headerChip('Sleep'),
          ],
        ),
      ),
    );
  }

  Widget _headerChip(String text) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
