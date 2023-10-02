import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: (data['correct_answer'] as String) ==
                            (data['user_answer'] as String)
                        ? Colors.green
                        : Colors.red,
                    child:
                        Text(((data['question_index'] as int) + 1).toString()),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(color: Colors.yellow),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(color: Colors.green),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 12,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
