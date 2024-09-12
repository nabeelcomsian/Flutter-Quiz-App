import 'package:flutter/material.dart';

class start_screen extends StatelessWidget {
   const start_screen(  this.startquiz,{super.key});
final void Function() startquiz;
 
  @override
  Widget build(BuildContext context) {
  
    return Center(
     
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assest/images/quiz-logo.png',
            width: 200,
            height: 200,
            color: const Color.fromARGB(112, 255, 255, 255),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Learn flutter the fun way',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          // const SizedBox(
          //   height: 100,
          // ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_circle_right),
            onPressed: startquiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text(
              'Start Quiz',
            ),
          )
        ],
      ),
    );
  }
}
