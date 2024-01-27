import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/conponent/box_shadow_component.dart';
import 'package:letutor/conponent/image_network_component.dart';



import '../../model/font_text.dart';
import '../../model/title_string.dart';
import '../courses/component/course_item_preview.dart';
import 'component/overview_detail_course.dart';
import 'component/sub_course_detail_component.dart';
import 'course_detail_controller.dart';

class CourseDetail extends GetWidget<CourseDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: BoxShadowComponent(
                width: double.infinity,
                child: CourseItemPreview(
                  image: ImageNetworkComponent(
                    url: controller.course.imageUrl,
                  ),
                  mainTitle: controller.course.name,
                  subTitle: controller.course.description,
                  bottomWidget: Text(
                    controller.course.topics.isEmpty
                        ? 'Intermediate'
                        : 'Intermediate ${controller.course.topics.length} lessons',
                    style: text14,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SubCourseDetailComponent(
              title: TitleString.overview,
              children: [
                OverviewDetailCourse(
                  title: TitleString.whyShouldYouTakeThisCourse,
                  content: controller.course.reason,
                ),
                const SizedBox(
                  height: 10,
                ),
                OverviewDetailCourse(
                  title: TitleString.whatCanYouDo,
                  content: controller.course.purpose,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SubCourseDetailComponent(
              title: TitleString.requireLevel,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person_add_alt_1_sharp),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      controller
                          .levels[int.tryParse(controller.course.level) ?? 1],
                      style: text14,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SubCourseDetailComponent(
              title: TitleString.courseLength,
              children: [
                Row(
                  children: [
                    const Icon(Icons.topic),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${controller.course.topics.length} Topics',
                      style: text14,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SubCourseDetailComponent(
              title: TitleString.topicList,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      ...controller.course.topics.map(
                        (e) => Column(
                          children: [
                            BoxShadowComponent(
                              onTap: () {
                                controller.handlePdfView(e);
                              },
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.course.topics
                                                .indexOf(e)
                                                .toString() +
                                            '.',
                                        style: text14.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Topic: ' + e.name,
                                        style: text14.copyWith(
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // SubCourseDetailComponent(
            //   title: TitleString.teacherSuggestion,
            //   children: [
            //     Row(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.symmetric(horizontal: 15),
            //           child: Row(
            //             children: [
            //               Text(
            //                 'Quan dz',
            //                 style: text14.copyWith(fontWeight: FontWeight.w600),
            //                 textAlign: TextAlign.center,
            //               ),
            //               TextButton(
            //                 onPressed: () {
            //                   Get.toNamed(AppRoutes.TEACHER_DETAIL);
            //                 },
            //                 child: Text(
            //                   'Xem thêm',
            //                   style:
            //                       text14.copyWith(fontWeight: FontWeight.w600),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ],
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
