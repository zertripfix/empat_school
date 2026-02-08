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
            HomeScreen(),
            ExploreScreen(),
            LibraryScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabController.index,
          fixedColor: Colors.white,
          onTap: (index) {
            setState(() {}); // Rebuild to update the the BottomNavigationBar
            _tabController.animateTo(index);
          },
          selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: Colors.white54),
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Library',
              icon: Icon(Icons.bookmark_outline),
              activeIcon: Icon(Icons.bookmark_rounded),
            ),
          ],
        ),
        drawer: DrawerNav(),
      ),
    );
  }
}
