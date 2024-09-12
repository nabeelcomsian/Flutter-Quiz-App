import 'package:flutter/material.dart';

class answer_button extends StatelessWidget {
  answer_button({required this.answer_text, required this.ontap, super.key});
  String answer_text;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            backgroundColor: const Color.fromARGB(255, 69, 30, 196),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            )),
        onPressed: ontap,
        child: Text(
          answer_text,
          textAlign: TextAlign.center,
        ));
  }
}
