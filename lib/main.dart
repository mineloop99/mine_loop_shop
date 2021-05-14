import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  int _questionIndex = 0;
  final questions = [{
    'questionText':'What\'s your favorite color?',
    'answers': ['Black',  'Red', 'Green', 'Black'],
    },{
    'questionText' : 'What\'s your favorite animal?',
    'answers': ['Lion',  'Elephant', 'Dolphin', 'Rat'],
    },{
    'questionText' : 'What\'s your favorite subject?',
    'answers': ['Math',  'Music', 'Rich', 'Poor'],
    }];

  void _answerQuestion(){
    if(_questionIndex >= questions.length)
      return null;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'].toString(),
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map(
                    (answer) => Answer(_answerQuestion, answer)
            ).toList(),
          ],
        ),
      ),
    );
  }
}
