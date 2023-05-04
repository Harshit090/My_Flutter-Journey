import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final textInputControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('How to tkae a user input using textfiled widget.'),
            TextField(
              decoration:
                  const InputDecoration(labelText: 'this takes user data.'),
              controller: textInputControler,
            ),
            const Text('the input text can be recorded using controler.'),
          ],
        ),
      ),
    );
  }
}
