import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restart;
  Result(this.resultScore, this.restart);
  String  get resultPhrase {
    var  resultText = 'You did it!';
    if(resultScore <= 8) {
      resultText = 'You are normal';
    } else if (resultScore < 12) {
      resultText = 'You are likable';
    } else {
      resultText = 'You are strange';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            )
          ),
          FlatButton(
            child: Text(
            'Restart Quiz',
            ),
            onPressed: restart,
            textColor: Colors.blue,
          )
          ]
        )
      );
  }
}