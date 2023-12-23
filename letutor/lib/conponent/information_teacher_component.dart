// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/conponent/assets.gen.dart';
import 'package:letutor/conponent/box_shadow_component.dart';
import 'package:letutor/conponent/circle_box.dart';
import 'package:letutor/conponent/image_network_component.dart';
import 'package:letutor/conponent/text_container_component.dart';
import 'package:letutor/model/tutor.dart';
import 'package:letutor/screen/home%20screen/dash_board_list_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class InformationTeacherComponent extends StatelessWidget {
  const InformationTeacherComponent({
    super.key,
    required this.countRating,
    required this.controller,
    required this.tutor,
  });
  final double countRating;
  final Tutor tutor;

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    debugPrint("Information Teacher");
    debugPrint(tutor.user?.avatar);
    return
        // Stack(
        //   children: [
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: BoxShadowComponent(
          padding: const EdgeInsets.all(30),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          width: Get.width - 20 - 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleBox(
                  size: 80,
                  child: ImageNetworkComponent(
                    url: tutor.user!.avatar,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  // tutor.user?.name ?? '',
                  "NAME"
                  // style: TextStyle(),
                  ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Assets.svg.vietnam.svg(height: 15, width: 25),
                  const SizedBox(width: 15),
                  Text(
                    // tutor.user?.country ?? '',
                    "vn",
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // countRating == 0
              //     ? const Text(
              //         "No review",
              //         style: TextStyle(color: Colors.grey),
              //       )
              //     : RatingBar.builder(
              //         initialRating: countRating,
              //         minRating: countRating,
              //         maxRating: countRating,
              //         direction: Axis.horizontal,
              //         allowHalfRating: true,
              //         itemCount: 5,
              //         itemSize: 20,
              //         itemPadding:
              //             const EdgeInsets.symmetric(horizontal: 4.0),
              //         itemBuilder: (context, _) => const Icon(
              //           Icons.star,
              //           color: Colors.amber,
              //           size: 5,
              //         ),
              //         onRatingUpdate: (rating) {},
              //       ),
              const SizedBox(
                height: 15,
              ),
              // Wrap(
              //   spacing: 5,
              //   runSpacing: 10,
              //   children: [
              //     ...tutor.specialties
              //         .split(",")
              //         .map((e) => TextContainerComponent(
              //               title: e,
              //               textColor: Colors.indigo,
              //               color: Colors.cyan,
              //             ))
              //   ],
              // ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "tutor.bio",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: Get.width / 2 - 30,
                  child: TextButton(
                    onPressed: () {
                      controller.navigateTutorDetail(tutor);
                    },
                    child: TextContainerComponent(
                      title: "Book",
                      textColor: Colors.indigo,
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          )),
      // ),
      // const Positioned(
      //     right: 30,
      //     top: 30,
      //     child: Icon(
      //       Icons.favorite,
      //       color: Colors.red,
      //       size: 25,
      //     ))
      // ],
    );
  }
}
