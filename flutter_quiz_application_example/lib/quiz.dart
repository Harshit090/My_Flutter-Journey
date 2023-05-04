import 'package:flutter/material.dart';
import './answerbutton.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function answerButtonFunction;
  final List<Map<String, Object>> dataMap;
  final int index;

  Quiz({
    @required this.dataMap,
    @required this.answerButtonFunction,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          dataMap[index]['questionText'] as String,
        ),
        ...(dataMap[index]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer_Button(
              () => answerButtonFunction(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
