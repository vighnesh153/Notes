import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestionFunction;
  final int questionIndex;

  Quiz(this.questions, this.answerQuestionFunction, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    var currentQuestionMap = questions[questionIndex];
    var answers = (
        currentQuestionMap['answerText'] as List<Map<String, Object>>
    );

    return Column(
      children: [
        Question(currentQuestionMap['questionText']),
        ...answers.map((answer) {
          return Answer(
              answer, () => answerQuestionFunction(answer['score'])
          );
        }),
      ],
    );
  }
}
