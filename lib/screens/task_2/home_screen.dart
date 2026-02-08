import 'package:empat_school/widgets/task_2/sliver_content.dart';
import 'package:empat_school/widgets/task_2/sliver_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
        SliverContent(),
      ],
    );
  }    
}
