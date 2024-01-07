import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final int currentIndex;
  final String question;
  final bool isSelected;
  final int? selectedAnswerIndex;
  final int correctAnswerIndex;

  const AnswerCard({
    required this.currentIndex,
    required this.question,
    required this.isSelected,
    required this.selectedAnswerIndex,
    required this.correctAnswerIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected
            ? (selectedAnswerIndex == correctAnswerIndex
                ? Colors.green
                : Colors.red)
            : null,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: isSelected
                ? (selectedAnswerIndex == correctAnswerIndex
                    ? Colors.green
                    : Colors.red)
                : Colors.grey,
            child: Text(
              '${currentIndex + 1}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              question,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
