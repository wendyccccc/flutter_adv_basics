import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.backHome, {
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  final void Function() backHome;

  // Map: <key:value>
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('分數：$numCorrectQuestions/$numTotalQuestions',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
              const SizedBox(height: 30),
              QuestionsSummary(getSummaryData()),
              const SizedBox(height: 30),
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 72, 16, 81),
                ),
                icon: const Icon(Icons.keyboard_backspace_sharp),
                label: const Text('重測一遍'),
                onPressed: backHome,
              ),
            ],
          ),
        ));
  }
}
