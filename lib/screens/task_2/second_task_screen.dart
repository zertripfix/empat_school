import 'package:empat_school/mock/mock_data.dart';
import 'package:empat_school/models/task_2/song_item.dart';
import 'package:empat_school/widgets/task_2/bottom_nav_bar.dart';
import 'package:empat_school/widgets/task_2/drawer_nav.dart';
import 'package:flutter/material.dart';

import 'explore_screen.dart';
import 'home_screen.dart';
import 'library_screen.dart';

class SecondTaskScreen extends StatefulWidget {
  const SecondTaskScreen({super.key});

  @override
  State<SecondTaskScreen> createState() => _SecondTaskScreenState();
}

class _SecondTaskScreenState extends State<SecondTaskScreen>
    with SingleTickerProviderStateMixin {
  List<SongItem> allSongs = mockSongs;
  Set<SongItem> likedSongs = {};

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleLike(SongItem song) {
    setState(() {
      if (likedSongs.contains(song)) {
        likedSongs.remove(song);
      } else {
        likedSongs.add(song);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(
              allSongs: allSongs,
              likedSongs: likedSongs,
              onLikeToggle: _toggleLike,
            ),
            ExploreScreen(),
            LibraryScreen(
              likedSongs: likedSongs,
              onLikeToggle: _toggleLike,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(tabController: _tabController),
        drawer: DrawerNav(),
      ),
    );
  }
}
