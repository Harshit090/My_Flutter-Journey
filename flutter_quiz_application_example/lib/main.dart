import 'package:flutter/material.dart';

import './quiz.dart';
import 'answerresult.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());
//alternate syntac to the baove code if we have a single widget to write in an expression of code.

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  var _dataMap = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];
  // variable for indexing question's list.
  var _index = 0;
  var _answerScore = 0;

  void _restartQuiz() {
    setState(() {
      _index = 0;
      _answerScore = 0;
    });
  }

  // Function for buttons.
  // ' _ ' in front of the name is to make sure that the variable of class is private and cannot be acessed by other files.
  void _answerButtonFunction(int score) {
    _answerScore += score;
    setState(
      () {
        _index = _index + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _index < _dataMap.length
            ? Quiz(
                answerButtonFunction: _answerButtonFunction,
                dataMap: _dataMap,
                index: _index,
              )
            : AnswerResult(_answerScore, _restartQuiz),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
