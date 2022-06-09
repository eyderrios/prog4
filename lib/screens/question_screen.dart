import 'package:flutter/material.dart';

import '../models/question.dart';
import '../widgets/option_button.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final void Function(bool) onAnswer;

  const QuestionScreen({
    required this.question,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final options = List<OptionButton>.generate(
      question.options.length,
      (index) => OptionButton(
        text: question.options[index].text,
        correct: question.options[index].correct,
        onPressed: onAnswer,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              question.text,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...options,
        ],
      ),
    );
  }
}
