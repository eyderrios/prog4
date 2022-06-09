import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final bool correct;
  final void Function(bool) onPressed;

  const OptionButton({
    required this.text,
    required this.correct,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 20.0,
      ),
      child: ElevatedButton(
        onPressed: () => onPressed(correct),
        child: Text(text),
      ),
    );
  }
}
