import 'package:empat_school/task_1/first_task_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empat shool',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Color.fromRGBO(172, 214, 184, 1)),
      ),
      home: const FirstTaskPage(title: 'Task 1'),
    );
  }
}

