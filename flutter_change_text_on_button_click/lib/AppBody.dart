import 'package:flutter/material.dart';

import './AppText.dart';

int index = 0;

class AppBody extends StatefulWidget {
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  void changeText() {
    setState(() {
      if (index < 4) {
        index += 1;
      } else {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The First Assignment'),
      ),
      body: Center(
        child: Column(
          children: [
            AppText(index),
            ElevatedButton(
              onPressed: changeText,
              child: const Text('Change'),
            ),
          ],
        ),
      ),
    );
  }
}
