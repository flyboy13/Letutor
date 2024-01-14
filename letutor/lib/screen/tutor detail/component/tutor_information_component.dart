// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:letutor/common/constant.dart';
import 'package:letutor/conponent/assets.gen.dart';
import 'package:letutor/conponent/circle_box.dart';
import 'package:letutor/conponent/image_network_component.dart';
import 'package:letutor/screen/home%20screen/tutor_controller.dart';
import 'package:letutor/screen/tutor%20detail/component/text_icon_component.dart';
import 'package:letutor/screen/tutor%20detail/tutor_detail_controller.dart';

import '../tutor_detail.dart';

class TutorInformationComponent extends StatelessWidget {
  final TutorDetailController controller;
  final TutorController dashBoardListController = Get.find();

  TutorInformationComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    print(
        "teacherInformationComponent language:   ${controller.tutor.value.userModel?.getName()}");

    String? avatar = controller.tutor.value.userModel?.avatar;

    print("=======================Tutor=========================");
    print(controller.tutor.value.userModel?.id);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleBox(
                    size: 110,
                    child: ImageNetworkComponent(
                        url: avatar ??
                            "https://cdn4.iconfinder.com/data/icons/solid-part-6/128/image_icon-512.png")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.tutor.value.userModel?.name ?? "No name",
                      style: const TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 4,
                      maxRating: 4,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 5,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Assets.svg.vietnam.svg(height: 15, width: 25),
                        const SizedBox(width: 15),
                        Text(
                          controller.tutor.value.userModel?.country ??
                              "No country",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            controller.tutor.value.bio,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => InkWell(
                  child: TextIconComponent(
                    iconData: Icons.favorite,
                    title: "Favourite",
                    color: dashBoardListController
                            .favouriteTutor(controller.tutorId)
                        ? Colors.red
                        : Colors.grey,
                  ),
                  onTap: () {
                    dashBoardListController
                        .manageTeacherFavorite(controller.tutorId);
                    dashBoardListController
                        .manageListFavouriteTutor(controller.tutorId);
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  controller.reasonController.clear();
                  for (var element in controller.reportTitleMap.entries) {
                    controller.reportTitleMap[element.key] = false;
                  }
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogReportTeacher(
                          controller: controller,
                          teacherId: controller.tutorId,
                        );
                      });
                },
                child: const TextIconComponent(
                  iconData: Icons.report,
                  title: "Report",
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(API.feedback,
                      arguments: {'id': controller.tutor.value.userModel!.id});
                },
                child: const TextIconComponent(
                  iconData: Icons.star,
                  title: "Reviews",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
