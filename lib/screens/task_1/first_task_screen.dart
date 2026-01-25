import 'package:flutter/material.dart';

import 'person.dart';
import 'person_card.dart';

class FirstTaskScreen extends StatefulWidget {
  const FirstTaskScreen({super.key});

  @override
  State<FirstTaskScreen> createState() => _FirstTaskScreenState();
}

class _FirstTaskScreenState extends State<FirstTaskScreen> {
  Person person = Person('Denis', 'Gazhur');

  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    super.dispose();
  }

  void _changeName(String firstName, String lastName) {
    setState(() {
      person.firstName = firstName;
      person.lastName = lastName;
    });
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            TextField(
              controller: _firstNameTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'new First Name',
              ),
            ),

            TextField(
              controller: _lastNameTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'new Last Name',
              ),
            ),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () {
              _changeName(
                _firstNameTextController.text,
                _lastNameTextController.text,
              );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 1"),
        centerTitle: true,
      ),
      body: Center(child: PersonCard(person: person)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showEditDialog(context);
        },
        tooltip: 'Edit',
        icon: const Icon(Icons.edit),
        label: const Text('Edit'),
      ),
    );
  }
}
