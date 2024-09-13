import 'package:flutter/material.dart';
import 'package:adv_basics/circle_number.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircledNumber(
                        number: (data['question_index'] as int) + 1,
                        backgroundColor:
                            data['user_answer'] == data['correct_answer']
                                ? const Color.fromARGB(255, 63, 158, 235)
                                : const Color.fromARGB(255, 238, 78, 131),
                        textColor: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['question'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('你的答案：${data['user_answer'] as String}',
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            Text('正確解答：${data['correct_answer'] as String}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 222, 191, 255),
                                )),
                          ],
                        ),
                      ),
                    ]),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
