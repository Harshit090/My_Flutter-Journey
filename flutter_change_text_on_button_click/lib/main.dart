import 'package:flutter/material.dart';

import './AppBody.dart';

void main() => runApp(MyWidget());

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AppBody());
  }
}
