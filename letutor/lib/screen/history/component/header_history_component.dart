import 'package:flutter/cupertino.dart';
import 'package:letutor/conponent/assets.gen.dart';
import 'package:letutor/conponent/circle_box.dart';
import 'package:letutor/model/font_text.dart';
import 'package:letutor/model/title_string.dart';

class HeaderHistoryComponent extends StatelessWidget {
  const HeaderHistoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleBox(size: 140, child: Assets.svg.historyLogo.svg()),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TitleString.historySchedule,
                style: text20.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                TitleString.hereIsListOfLessonsYouHaveTaken,
                style: text16.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                TitleString.youCanReviewDetailsOfLessonYouHaveAttached,
                style: text16.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
