import 'package:flutter/material.dart';

class CardTask extends StatelessWidget {
  final Widget screen;
  final String label;
  
  const CardTask({super.key, required this.screen, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen),
      ),
      child: Card(
        child: Center(
          child: Text(label, style: TextStyle(fontSize: 18),),
        ),
      ),
    );
  }
}
