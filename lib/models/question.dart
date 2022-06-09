class Option {
  final String text;
  final bool correct;

  const Option({
    required this.text,
    required this.correct,
  });
}

class Question {
  final String text;
  final int value;
  final List<Option> options;

  const Question({
    required this.text,
    required this.value,
    required this.options,
  });

  Question copy() {
    return Question(
      text: text,
      value: value,
      options: List<Option>.from(options),
    );
  }
}
