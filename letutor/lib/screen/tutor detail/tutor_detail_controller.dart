// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/control/app.dart';
import 'package:letutor/control/base_controller.dart';
import 'package:letutor/database/service/tutor_api.dart';
import 'package:letutor/model/schedule.dart';
import 'package:letutor/model/tutor.dart';
import 'package:letutor/database/service/model_service.dart';
// import 'package:letutor/model/user.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class TutorDetailController extends BaseController {
  final _tutorService = Get.find<TutorApi>();
  final _appController = Get.find<App>();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final listSpecial = [
    'English for Business',
    'Conversational',
    'English for kids',
    'IELTS',
    'TOEIC'
  ];
  Rx<bool> isLoadingVideo = true.obs;
  Rx<bool> isPlayingVideo = false.obs;
  late bool checkUrl;
  late bool checkVideo;
  final Rx<bool> isLoadingInit = true.obs;
  late VideoPlayerController videoController;
  final Rx<bool> isFavorite = true.obs;
  late String tutorId;
  final Rx<Tutor> tutor = Tutor().obs;
  final RxList<Schedule> schedules = <Schedule>[].obs;

  final TextEditingController reasonController = TextEditingController();
  final Map<String, bool> reportTitleMap = {
    "This Tutor annoy me": false,
    "This profile is fake": false,
    "Profile do not match": false,
  };

  @override
  Future<void> onInit() async {
    setUpData();
    super.onInit();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void setUpData() async {
    // Get the GoRouterState

    // Get the tutorId parameter
    tutorId = Get.arguments['id'];

    try {
      print("Get Tutorid: $tutorId");
      await getDataTutor();
      await getDataSchedule();
      isFavorite.value = tutor.value.isFavorite;
      print("Video of tutor: ${tutor.value.video}");

      checkUrl = tutor.value.video.isVideoFileName;
      print("checkUrl : $checkUrl");

      if (checkUrl) {
        final response = await http.head(Uri.parse(tutor.value.video));
        print("Status code: ${response.statusCode}");
        if (response.statusCode == 200) {
          videoController =
              VideoPlayerController.networkUrl(Uri.parse(tutor.value.video));
          videoController.initialize().then((value) {
            isLoadingVideo.value = false;
          });
          videoController.play();
        }
        

      }
      isLoadingInit.value = false;
    } catch (e) {
      print("Error of setup Data Tutor detail Controller: $e");

      isLoadingInit.value = false;
    }
  }

  onTapVideo() {
    isPlayingVideo.value = !isPlayingVideo.value;
    if (isPlayingVideo.value) {
      videoController.play();
    } else {
      videoController.pause();
    }
  }

  getDataTutor() async {
    tutor.value = await _tutorService.getTutorById(tutorId);
  }

  getDataSchedule() async {
    final res = await _tutorService.getSchedule(tutorId);
    schedules.value = (res['scheduleOfTutor'] == null)
        ? []
        : (res['scheduleOfTutor'] as List)
            .map((e) => Schedule.fromJson(e))
            .toList();
  }

  void reportTeacher(String teacherId) async {
    if (reasonController.text.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        message: "Please enter reason",
        duration: Duration(milliseconds: 200),
        borderRadius: 20,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
        backgroundColor: Colors.red,
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ));
      return;
    }
    try {
      // final res =
      await _tutorService.reportTutor(reasonController.text, tutorId);
      Get.showSnackbar(const GetSnackBar(
        message: "Report Successfully!",
        duration: Duration(milliseconds: 200),
        borderRadius: 20,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
        backgroundColor: Colors.blue,
        icon: Icon(
          Icons.done,
          color: Colors.white,
        ),
      ));
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
        duration: const Duration(milliseconds: 200),
        borderRadius: 20,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
        backgroundColor: Colors.red,
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ));
    }
  }
}
