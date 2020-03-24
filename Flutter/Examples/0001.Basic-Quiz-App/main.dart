import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answerText': [
        {'value': 'Red', 'score': 10},
        {'value': 'Blue', 'score': 20},
        {'value': 'Green', 'score': 30},
        {'value': 'Yellow', 'score': 40},
      ]
    },
    {
      'questionText': 'What is your favourite animal?',
      'answerText': [
        {'value': 'Rabbit', 'score': 10},
        {'value': 'Snake', 'score': 20},
        {'value': 'Elephant', 'score': 30},
        {'value': 'Lion', 'score': 40},
      ]
    },
    {
      'questionText': 'What is your favourite framework?',
      'answerText': [
        {'value': 'Angular', 'score': 40},
        {'value': 'React', 'score': 30},
        {'value': 'Vue', 'score': 20},
        {'value': 'Backbone', 'score': 10},
      ]
    },
  ];

  void answerQuestion(int score) {
    if (_questionIndex >= _questions.length) {
      return;
    }
    setState(() {
      _questionIndex++;
    });
    _totalScore += score;
  }

  void _resetQuiz() {
    setState(() {
      this._questionIndex = 0;
      this._totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    var body = _questionIndex < _questions.length ?
      Quiz(_questions, answerQuestion, _questionIndex) :
      Result(_totalScore, _resetQuiz);

    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(title: new Text('RV'),),
            body: body,
        )
    );
  }
}
