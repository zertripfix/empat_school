import 'package:flutter/material.dart';

import 'person.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: [
            CircleAvatar(
              radius: 54,
              backgroundColor: Color.fromRGBO(172, 214, 184, 1),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('lib/lab_1/avatar.jpg'),
              ),
            ),
            Text(
              person.fullName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Chip(label: Text(person.role)),
          ],
        ),
      ),
    );
  }
}
