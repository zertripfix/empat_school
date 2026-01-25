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
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              backgroundColor: Colors.black,

              flexibleSpace: FlexibleSpaceBar(
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
                          stops: [0.3, 0.7, 1],
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
                          _topRow(),
                          const SizedBox(height: 12),
                          _chipsRow(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                children: List.generate(
                  20,
                  (i) => Container(
                    height: 80,
                    margin: EdgeInsets.all(8),
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topRow() {
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
                radius: 14,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
                backgroundColor: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chipsRow() {
    return SizedBox(
      height: 36,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _chip('text'),
            _chip('text'),
            _chip('text'),
            _chip('text'),
            _chip('text'),
            _chip('text'),
            _chip('text'),
            _chip('text'),
            _chip('text'),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
