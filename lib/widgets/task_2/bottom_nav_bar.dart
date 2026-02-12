import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final TabController tabController;
  const BottomNavBar({super.key, required this.tabController});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          currentIndex: widget.tabController.index,
          fixedColor: Colors.white,
          onTap: (index) {
            setState(() {}); // Rebuild to update the the BottomNavigationBar
            widget.tabController.animateTo(index);
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
        );
  }
}