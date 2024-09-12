import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/answer_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz_state();
  }
}

class _Quiz_state extends State<Quiz> {
  //Widget? activescreen;
  // first method of render content conditionaly
  // @override
  // void initState() {
  //   super.initState();
  //   activescreen = start_screen(switchscreen);
  // }
  // second method of rendering content conditionalaly
  String activescreen = 'start-screen';

  List<String> answerlist = [];

  void switchscreen() {
    setState(() {
      activescreen = 'question-screen';
    });
  }

  void selectedanswer(String answer) {
    answerlist.add(answer);
    if (answerlist.length == questions.length) {
      setState(() {
        activescreen = "answer-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      answerlist = [];
      activescreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = start_screen(switchscreen);
    if (activescreen == 'question-screen') {
      screenwidget = Question_screen(onSelectedAnswer: selectedanswer);
    }
    if (activescreen == 'answer-screen') {
      screenwidget = answer_screen(
        choosen_summary: answerlist,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      //to remove Debug banner
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 93, 23, 207),
                  Color.fromARGB(255, 106, 83, 120)
                ]),
          ),
          child: screenwidget,
        ),
      ),
    );
  }
}
