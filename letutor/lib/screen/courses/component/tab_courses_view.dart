import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:letutor/conponent/tab_bar_item_component.dart';
import 'package:letutor/model/title_string.dart';

import '../courses_controller.dart';
import 'course_preview.dart';

class TabCourseView extends StatelessWidget {
  TabCourseView({super.key, required this.controller});
  CoursesController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabBarItem(
                onTap: () {
                  controller.onTapInDexTabBarCourses(0);
                },
                title: TitleString.course,
                isSelecting: 0 == controller.index.value,
              ),
              const SizedBox(width: 20),
              TabBarItem(
                onTap: () {
                  controller.onTapInDexTabBarCourses(1);
                },
                title: TitleString.ebook,
                isSelecting: 1 == controller.index.value,
              ),
              const SizedBox(width: 20),
              TabBarItem(
                onTap: () {
                  controller.onTapInDexTabBarCourses(2);
                },
                title: TitleString.interactiveEbook,
                isSelecting: 2 == controller.index.value,
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      ...controller.courseMap.entries.map(
                        (e) => CoursePreview(title: e.key, course: e.value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
