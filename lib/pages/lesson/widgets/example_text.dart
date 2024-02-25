import 'package:flutter/material.dart';
import '../../../core/models/lesson.dart';
import '../../../core/constants/fonts.dart';

class ExampleText extends StatelessWidget {
  final Lesson lesson;

  const ExampleText({required this.lesson, super.key});

  static const _exampleStyle = TextStyle(color: Colors.black, fontFamily: AppFonts.digitalt, fontSize: 48);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${lesson.number} ',
            style: _exampleStyle.copyWith(color: Colors.red),
          ),
          TextSpan(text: lesson.exampleHeader),
        ],
      ),
      style: _exampleStyle,
    );
  }
}
