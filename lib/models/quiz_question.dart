class QuizQuestion {
  const QuizQuestion(this.text, this.answer);
  final String text;
  final List<String> answer;

  List<String> getshuffelanswer() {
    List<String> shuffellist = List.of(answer);
    shuffellist.shuffle();
    return shuffellist;
  }
}
