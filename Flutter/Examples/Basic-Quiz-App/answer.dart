import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function clickHandler;
  final Map<String, Object> answer;

  Answer(this.answer, this.clickHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answer['value']),
        onPressed: clickHandler,
      ),
    );
  }

}