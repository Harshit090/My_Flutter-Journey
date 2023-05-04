import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 30,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        //style: TextStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
