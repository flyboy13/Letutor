import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letutor/conponent/assets.gen.dart';
import 'package:letutor/conponent/circle_box.dart';

class HeaderScheduleComponent extends StatelessWidget {
  const HeaderScheduleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleBox(size: 140, child: Assets.svg.calendarCheck.svg()),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book scheduel",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "List Book",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "You Can Track When TheLesson Starts Join The Class With One ClickOrCanCancelTheLessonTwoHoursInAdvance",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
