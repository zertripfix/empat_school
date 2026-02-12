import 'package:empat_school/models/task_2/song_item.dart';
import 'package:empat_school/widgets/task_2/sliver_content.dart';
import 'package:empat_school/widgets/task_2/sliver_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<SongItem> allSongs;
  final Set<SongItem> likedSongs;
  final void Function(SongItem song) onLikeToggle;

  const HomeScreen({
    super.key,
    required this.allSongs,
    required this.likedSongs,
    required this.onLikeToggle,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/* AutomaticKeepAliveClientMixin used for keeping the state of the screen when
swithching between tabs. It prevents lags when switching back to the screen with 
a lot of content.
 */
class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverHeader(),
        SliverContent(
          allSongs: widget.allSongs,
          likedSongs: widget.likedSongs,
          onLikeToggle: widget.onLikeToggle,
        ),
      ],
    );
  }
}
