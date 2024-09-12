import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/summary_screen.dart';
//import 'package:quiz_app/quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class answer_screen extends StatelessWidget {
  answer_screen({
    super.key,
    required this.choosen_summary,
    required this.onRestart,
  });
  void Function() onRestart;
  List<String> choosen_summary;
  final List<Map<String, Object>> summary = [];

  List<Map<String, Object>> getresultsummery() {
    for (int i = 0; i < choosen_summary.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'user_answer': choosen_summary[i],
        'correct_answer': questions[i].answer[0],
        'is_true': choosen_summary[i] == questions[i].answer[0],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary_data = getresultsummery();
    final total_question = questions.length;
    final right_answer = summary_data.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you enter $right_answer out of $total_question',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 192, 154, 240),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            summary_screen(summaryData: summary_data),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: onRestart,
             child: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
