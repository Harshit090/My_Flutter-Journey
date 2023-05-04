import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  int index;
  var TextData = [
    '#####---TEST---#####',
    'Hello',
    'How',
    'Are',
    'You',
  ];

  AppText(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Text(TextData[index]);
  }
}
