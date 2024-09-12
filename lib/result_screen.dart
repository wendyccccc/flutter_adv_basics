import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('你答對了X題！'),
              const SizedBox(height: 30),
              const Text('問題與答案列表'),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: const Text('重測一遍！'),
              ),
            ],
          ),
        ));
  }
}
