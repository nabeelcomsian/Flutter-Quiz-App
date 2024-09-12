import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class summary_screen extends StatelessWidget {
  const summary_screen({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            // Determine the background color based on the answer correctness
            Color circleColor = (data['user_answer'] as String) ==
                    (data['correct_answer'] as String)
                ? Color.fromARGB(255, 139, 214, 142)
                : Color.fromARGB(255, 237, 124, 116);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Circle for question index with conditional background color
                  Container(
                    width: 30, // Width of the circle
                    height: 30, // Height of the circle
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: circleColor, // Conditional background color
                      shape: BoxShape.circle, // Makes the container a circle
                      //border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontSize: 16, // Adjust font size as needed
                        fontWeight:
                            FontWeight.bold, // Optional: Make the text bold
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Space between circle and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14, // Adjust font size as needed
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Your Answer: ${data['user_answer'] as String}',
                          style: const TextStyle(
                            color: Colors.yellow, // Change color as needed
                            fontSize: 12, // Adjust font size as needed
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Correct Answer: ${data['correct_answer'] as String}',
                          style: const TextStyle(
                            color: Colors.green, // Change color as needed
                            fontSize: 12, // Adjust font size as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
/*SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: (Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                    width: 25, // Width of the circle
                    height: 25, // Height of the circle
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the circle
                      shape: BoxShape.circle, // Makes the container a circle
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child:
                        Text(((data['question_index'] as int) + 1).toString())),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'] as String,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answer'] as String),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['correct_answer'] as String),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        )),
      ),
    );*/