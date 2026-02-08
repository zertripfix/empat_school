import 'package:flutter/material.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            // decoration: BoxDecoration(
            //   color: Colors.blueGrey,
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    // radius: 12,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  title: Text('Denis Gazhur'),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Your Channel'),
            onTap: () {
              // Handle Home navigation
            },
          ),
          ListTile(
            leading: Icon(Icons.download),
            title: Text('Downloads'),
            onTap: () {
              // Handle Explore navigation
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () {
              // Handle Library navigation
            },
          ),
          ListTile(
            leading: Icon(Icons.playlist_play),
            title: Text('Your Videos'),
            onTap: () {
              // Handle Library navigation
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle Library navigation
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Help & Feedback'),
            onTap: () {
              // Handle Library navigation
            },
          ),
        ],
      ),
    );
  }
}
