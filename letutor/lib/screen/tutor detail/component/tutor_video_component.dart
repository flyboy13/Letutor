// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:video_player/video_player.dart';

import '../tutor_detail_controller.dart';

class TutorVideoComponent extends StatelessWidget {
  var controller = Get.find<TutorDetailController>();

  TutorVideoComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Container(
            height: 260,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.blue, width: 2.0)),
            child: Center(
              child: !controller.isLoadingVideo.value
                  ? SizedBox(
                      height: 250,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.onTapVideo();
                            },
                            child: SizedBox(
                              height: 220,
                              child: AspectRatio(
                                  aspectRatio: controller
                                      .videoController.value.aspectRatio,
                                  child:
                                      VideoPlayer(controller.videoController)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              !controller.isPlayingVideo.value
                                  ? InkWell(
                                      onTap: () {
                                        controller.onTapVideo();
                                      },
                                      child: const Icon(
                                        Icons.play_arrow,
                                        size: 20,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        controller.onTapVideo();
                                      },
                                      child: const Icon(Icons.pause, size: 20)),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 20,
                                  child: VideoProgressIndicator(
                                      colors: const VideoProgressColors(
                                          playedColor: Colors.blue),
                                      controller.videoController,
                                      allowScrubbing: true),
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                            ],
                          )
                        ],
                      ))
                  : const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      )),
            ),
          )),
    );
  }
}
