import 'package:flutter/material.dart';

class AnswerResult extends StatelessWidget {
  final int resultScore;
  final Function resultHandler;

  AnswerResult(this.resultScore, this.resultHandler);

  String get reslutPhrase {
    var resultText = 'You Did It.!';
    if (resultScore <= 8) {
      resultText = 'You are awsome and inocent';
    } else if (resultScore <= 12) {
      resultText = 'You are pretty liakble';
    } else if (resultScore <= 16) {
      resultText = 'You are strange.';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            reslutPhrase,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            onPressed: resultHandler,
            child: Text('Restart Quiz!'),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
