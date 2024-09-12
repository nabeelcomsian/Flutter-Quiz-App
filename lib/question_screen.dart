import 'package:flutter/material.dart';
import 'package:quiz_app/answer-button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';


class Question_screen extends StatefulWidget {
  Question_screen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;
  @override
  State<Question_screen> createState() {
    return _Question_state();
  }
}

class _Question_state extends State<Question_screen> {
  var questionindex = 0;
  void answerquestion(String Answer) {
    setState(() {
      widget.onSelectedAnswer(Answer);
      questionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final current_question = questions[questionindex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              current_question.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 192, 154, 240),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ...current_question.getshuffelanswer().map((data) {
              return answer_button(
                  answer_text: data,
                  ontap: () {
                    answerquestion(data);
                  });
            }),
            // answer_button(answer: current_question.answer[0], ontap: () {}),
            // const SizedBox(
            //   height: 10,
            // ),
            // answer_button(answer: current_question.answer[1], ontap: () {}),
            // const SizedBox(
            //   height: 10,
            // ),
            // answer_button(answer: current_question.answer[2], ontap: () {}),
            // const SizedBox(
            //   height: 10,
            // ),
            // answer_button(answer: current_question.answer[3], ontap: () {}),
          ],
        ),
      ),
    );
  }
}
