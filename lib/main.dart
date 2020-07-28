import  'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main () => runApp(MyApp());


class MyApp extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
      {
        'questionText': 'What\'s your favourite color?',
        'answer': [
         { 'text':'Blue', 'score': 5}, 
         { 'text':'Yellow', 'score': 6}, 
         { 'text':'Red', 'score': 7}, 
         { 'text':'Brown', 'score': 8}, 
        ]
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answer': [
         { 'text':'Dog', 'score': 3}, 
         { 'text':'Cat', 'score': 6}, 
         { 'text':'Bird', 'score': 7}, 
         { 'text':'Lizard', 'score': 10}, 
        ]
      },
      {
        'questionText': 'Who\'s your favourite person?',
        'answer': [
         { 'text':'Dhruv', 'score': 1}, 
         { 'text':'Dhruv', 'score': 1}, 
         { 'text':'Dhruv', 'score': 1}, 
         { 'text':'Lebron', 'score': 10}, 
        ]
      },
    ];
    var _totalScore =  0;
  void _answerQuestion(int score) {
     _totalScore += score;
    if(_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    } else {
      print('End of questions');
    } 
  }
  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex=0; 
    });
  }
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('Quiz App'),),
      //body: Text('Dhruvinity  QUIZ app'),
      body: _questionIndex < _questions.length ? Quiz(
        question: _questions,
        questionIndex: _questionIndex, 
        answerQuestion: _answerQuestion,
        ) : Result(_totalScore,_resetQuiz)
    ),);
  }
}