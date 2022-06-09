import 'package:flutter/material.dart';

import 'models/question.dart';
import 'models/database.dart';

import './screens/question_screen.dart';
import './screens/result_screen.dart';

void main() {
  runApp(const QuizzApp());
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  final List<Question> _questions = List<Question>.empty(growable: true);
  int _questionIndex = 0;
  int _score = 0;

  int get _totalScore => _questions.fold(0, (value, q) => value + q.value);

  @override
  void initState() {
    debugPrint('initState()');

    super.initState();
    _resetState();

    debugPrint(_questions.toString());
  }

  void _resetState() {
    _questions.clear();
    _questions.addAll(Database.selectRandom(2));
    _questionIndex = 0;
    _score = 0;
  }

  void _checkAnswer(BuildContext context, bool correct) {
    final String msg;

    if (correct) {
      msg = 'Resposta correta!';
      setState(() {
        _score += _questions[_questionIndex].value;
      });
    } else {
      msg = 'Resposta incorreta!';
    }

    _messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 1),
      ),
    );

    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _messengerKey,
      home: (_questionIndex < _questions.length)
          ? QuestionScreen(
              question: _questions[_questionIndex],
              onAnswer: (correct) => _checkAnswer(context, correct),
            )
          : ResultScreen(
              score: _score,
              totalScore: _totalScore,
              onRestart: () {
                setState(() {
                  _resetState();
                });
              }),
    );
  }
}
