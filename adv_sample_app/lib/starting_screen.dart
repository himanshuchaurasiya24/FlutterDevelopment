import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opacity(
        //   opacity: 0.5,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: Colors.white.withOpacity(0.5),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Learn Quiz in fun way',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            onPressed: () {
              //...
              startQuiz();
            },
            icon: const Icon(Icons.start),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text('Start Quiz'))
      ],
    ));
  }
}
