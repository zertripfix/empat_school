import 'package:flutter/material.dart';

import '../task_1/first_task_screen.dart';
import '../task_2/second_task_screen.dart';
import 'widgets/card_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: GridView.count(
        padding: EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          CardTask(screen: FirstTaskScreen(), label: 'Task 1'),
          CardTask(screen: SecondTaskScreen(), label: 'Task 2'),
        ],
      ),
    );
  }
}
