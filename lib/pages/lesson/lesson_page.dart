import 'dart:math';
import 'package:get/get.dart';
import 'widgets/example_text.dart';
import 'package:flutter_svg/svg.dart';
import 'lesson_page_controller.dart';
import '../../core/models/lesson.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import '../../core/constants/config.dart';
import '../../core/constants/fonts.dart';
import '../../core/widgets/game_page.dart';
import 'widgets/lesson_back_button.dart';
import 'widgets/lesson_section_card.dart';
import '../home/widgets/lessons_list/widgets/lesson_card.dart';
import 'widgets/white_board_section/white_board_section.dart';

class LessonPage extends GetView<LessonPageController> {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = controller.color;
    final Lesson lesson = controller.lesson;
    final int lessonNumber = lesson.number;
    final double animalSize = lessonNumber == 1
        ? 200
        : lessonNumber < 5
            ? 150
            : lessonNumber <= 8
                ? 100
                : lessonNumber < 10
                    ? 90
                    : lessonNumber > 12
                        ? (lessonNumber > 16 ? 65 : 70)
                        : 75;
    final Widget lessonExampleCard = LessonSectionCard(
      lesson: lesson,
      color: color,
      backgroundColor: Colors.white,
      invertAudioButton: true,
      onAudioButtonTapped: () => controller.playLessonExample(),
      padding: const EdgeInsets.all(16),
      content: Column(
        children: [
          ExampleText(lesson: lesson),
          const SizedBox(height: 16),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: List<Widget>.generate(
                lesson.number,
                (index) {
                  return SizedBox(
                    height: animalSize,
                    width: animalSize,
                    child: SvgPicture.asset('assets/images/${lesson.name}.svg'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
    final Widget lessonContentCard = LessonSectionCard(
      lesson: lesson,
      color: color,
      backgroundColor: color,
      onAudioButtonTapped: () => controller.playLessonContent(),
      content: FittedBox(
        child: Text(
          lesson.number.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: AppFonts.digitalt, color: Colors.white),
        ),
      ),
    );
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ObxValue<Rx<LessonState>>(
          (rxLessonState) {
            return IgnorePointer(
              ignoring: rxLessonState.value == LessonState.completed,
              child: GamePage(
                child: SafeArea(
                  child: Padding(
                    padding: AppConfig.pagePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LessonBackButton(
                          color: controller.color,
                          onTap: () => Get.back(),
                        ),
                        const SizedBox(height: 16),
                        if (context.width > 600)
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(child: lessonContentCard),
                                      const SizedBox(height: 32),
                                      Expanded(flex: 2, child: lessonExampleCard),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 32),
                                const Expanded(flex: 2, child: WhiteBoardSection())
                              ],
                            ),
                          ),
                        if (context.width <= 600) ...[
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child: lessonContentCard),
                                const SizedBox(width: 16),
                                Expanded(flex: 2, child: lessonExampleCard),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Expanded(flex: 2, child: WhiteBoardSection()),
                        ],
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          controller.lessonState,
        ),
        ConfettiWidget(
          confettiController: controller.confettiController,
          blastDirection: pi / 2,
          numberOfParticles: 100,
          minBlastForce: 10,
          blastDirectionality: BlastDirectionality.explosive,
        ),
      ],
    );
  }
}
