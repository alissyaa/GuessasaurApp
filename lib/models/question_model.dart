class Question {
  final String text;
  final String imagePath;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.text,
    required this.imagePath,
    required this.options,
    required this.correctAnswerIndex,
  });
}
