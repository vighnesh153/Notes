import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetQuiz;

  Result(this.score, this.resetQuiz);

  String get resultPhrase {
    return 'You dit it! Your score is $score';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(child: Text('Restart Quiz!'), onPressed: resetQuiz,)
        ],
      ),
    );
  }
}
