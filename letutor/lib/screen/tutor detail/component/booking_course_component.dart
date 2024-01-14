import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/conponent/box_shadow_component.dart';
import 'package:letutor/model/schedule.dart';

import '../tutor_detail_controller.dart';

class BookingCourseComponent extends StatelessWidget {
  final String date;
  final String time;
  final bool isDisable;
  final bool isBooked;
  final Schedule schedule;
  final controller = Get.find<TutorDetailController>();

  BookingCourseComponent({
    super.key,
    required this.date,
    required this.time,
    this.isDisable = false,
    this.isBooked = false,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BoxShadowComponent(
          width: Get.width,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                width: 100,
                height: 30,
                child: !isBooked && !isDisable
                    ? TextButton(
                        onPressed: () {
                          // controller.book(schedule.scheduleDetails[0].id);
                        },
                        child: const Text("Book"))
                    : TextButton(
                        onPressed: () {}, child: const Text("Đã được đặt")),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
