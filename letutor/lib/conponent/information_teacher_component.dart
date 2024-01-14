// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:letutor/conponent/assets.gen.dart';
import 'package:letutor/conponent/box_shadow_component.dart';
import 'package:letutor/conponent/circle_box.dart';
import 'package:letutor/conponent/image_network_component.dart';
import 'package:letutor/conponent/text_container_component.dart';
import 'package:letutor/model/tutor.dart';
import 'package:letutor/screen/home%20screen/tutor_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:letutor/screen/home%20screen/tutor_screen.dart';

import '../common/constant.dart';

class InformationTeacherComponent extends StatelessWidget {
  const InformationTeacherComponent({
    super.key,
    required this.countRating,
    required this.controller,
    this.tutor,
  });

  final double countRating;
  final Tutor? tutor;
  final TutorController controller;

  @override
  Widget build(BuildContext context) {
    Size size = resolution(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: BoxShadowComponent(
              padding: const EdgeInsets.all(10),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              width: size.width - 20 - 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleBox(
                        size: 80,
                        child: ImageNetworkComponent(
                          url: tutor?.user?.avatar ?? '',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(tutor?.user?.name ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Assets.svg.vietnam.svg(height: 15, width: 25),
                          SizedBox(width: 15),
                          Text(
                            tutor?.user?.country ?? 'VN',
                            // "vn",
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  countRating == 0
                      ? const Text(
                          "No review",
                          style: TextStyle(color: Colors.grey),
                        )
                      : RatingBar.builder(
                          initialRating: countRating,
                          minRating: countRating,
                          maxRating: countRating,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 5,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  tutor?.specialties != null
                      ? Wrap(
                          spacing: 5,
                          runSpacing: 10,
                          children: [
                            ...tutor!.specialties
                                .split(",")
                                .map((e) => TextContainerComponent(
                                      title: e,
                                      textColor: Colors.indigo,
                                      color: Colors.cyan,
                                    ))
                          ],
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    tutor!.bio,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                          width: size.width / 2 - 30,
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue,
                                  Color.fromARGB(255, 255, 170, 174)
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  controller.navigateTutorDetail(tutor!);

                                  // Get.toNamed(API.getTutor, arguments: {'id': tutor?.id});
                                },
                                borderRadius: BorderRadius.circular(30),
                                child: const Center(
                                  child: Text(
                                    "Book",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              )),
        ),
        // const Positioned(
        //     right: 30,
        //     top: 30,
        //     child: Icon(
        //       Icons.favorite,
        //       color: Colors.red,
        //       size: 25,
        //     )),

        Obx(
          () => Positioned(
            right: 30,
            top: 30,
            child: IconButton(
              onPressed: () {
                controller.manageListFavouriteTutor(tutor!.userId);
                controller.manageTeacherFavorite(tutor!.userId);
              },
              icon: Icon(
                Icons.favorite,
                color: controller.favouriteTutor(tutor!.userId)
                    ? Colors.red
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
