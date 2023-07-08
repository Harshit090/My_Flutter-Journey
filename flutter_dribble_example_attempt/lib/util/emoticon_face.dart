import 'package:flutter/material.dart';

class EmoticonFace extends StatelessWidget {
  final String emoticonfaceemoji;

  EmoticonFace({required this.emoticonfaceemoji});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[600], borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(10),
      child: Text(
        emoticonfaceemoji,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
