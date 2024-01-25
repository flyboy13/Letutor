import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:letutor/conponent/circle_box.dart';
import 'package:letutor/conponent/image_network_component.dart';
import 'package:letutor/screen/review/review_controller.dart';

import 'package:number_paginator/number_paginator.dart';

class ReviewPage extends GetWidget<ReviewController> {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    ...controller.reviews.map(
                      (e) => Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleBox(
                                size: 40,
                                child: ImageNetworkComponent(
                                    url: e.firstInfo?.avatar ?? '')),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      e.firstInfo?.name ?? "No name",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      e.createdAt.toString(),
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                RatingBar.builder(
                                  initialRating: e.rating.toDouble(),
                                  minRating: 0,
                                  maxRating: 5,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 5,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                SizedBox(
                                  width: Get.width - 100,
                                  child: Text(
                                    e.content,
                                    style: const TextStyle(fontSize: 25),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: NumberPaginator(
                            config: NumberPaginatorUIConfig(
                              buttonShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              mode: ContentDisplayMode.numbers,
                            ),
                            onPageChange: (value) {
                              controller.pageSelected.value = value;
                              controller.getData(page: value + 1);
                            },
                            numberPages: controller.totalPage.value,
                            initialPage: controller.pageSelected.value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
