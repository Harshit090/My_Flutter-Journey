import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List View Builder'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.vertical, //or Axis.horizontal
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.cyan.shade200,
                    child: Container(
                        height: 100,
                        width: 50,
                        child: Center(child: Text('Card NO $index'))),
                  );
                },
                itemCount: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
