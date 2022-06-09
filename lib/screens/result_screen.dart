import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalScore;
  final void Function() onRestart;

  const ResultScreen({
    required this.score,
    required this.totalScore,
    required this.onRestart,
  });

  String get rankName {
    final rank = totalScore != 0 ? score / totalScore : 0.0;
    final String name;

    if (rank <= 0.25) {
      name = 'FERRRO';
    } else if (rank <= 0.50) {
      name = 'BRONZE';
    } else if (rank <= 0.75) {
      name = 'PRATA';
    } else {
      name = 'OURO';
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz :: Resultado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PONTUAÇÃO',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$score / $totalScore',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48.0),
            const Text(
              'CLASSIFICAÇÃO',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              rankName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 64.0),
            ElevatedButton(
              onPressed: onRestart,
              child: const Text('REINICIAR'),
            ),
          ],
        ),
      ),
    );
  }
}
