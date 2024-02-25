import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/models/lesson.dart';
import 'lessons_list/lessons_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';
import 'package:get/get.dart';

class PuzzleButton extends GetView<LessonsListController> {
  const PuzzleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue<Rx<Lesson>>(
      (rxActiveLesson) {
        final bool didCompleteAllLessons = rxActiveLesson.value == Lesson.values.last;
        return Opacity(
          opacity: didCompleteAllLessons ? 1 : 0.5,
          child: Animate(
            effects: const [ShimmerEffect()],
            onComplete: (controller) => controller.repeat(period: const Duration(seconds: 5)),
            child: GameButton(
              text: 'QUIZ',
              horizontalPadding: 32,
              onTap: () {
                if (didCompleteAllLessons) controller.openPuzzlePage();
              },
            ),
          ),
        );
      },
      controller.activeLesson,
    );
  }
}
