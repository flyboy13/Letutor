import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:letutor/control/base_controller.dart';
import 'package:letutor/database/service/tutor_api.dart';
import 'package:letutor/database/service/user_api.dart';
import 'package:letutor/model/schedule.dart';
import 'package:letutor/model/tutor.dart';

class HomeScreenController extends BaseController {
  final _tutorService = Get.find<TutorApi>();
  final _userService = Get.find<UserApi>();

  RxList<Tutor> listTutor = <Tutor>[].obs;
  RxString currentType = 'All'.obs;
  RxList<String> valueContriesSelected = <String>[].obs;

  RxList<Schedule> schedules = <Schedule>[].obs;
  RxInt totalTime = 0.obs;
  Rx<String> upComming = ''.obs;

  final listType = [
    'All',
    'English for kids',
    'English for Business',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS'
  ];
  final Map<String, bool> nationality = {
    'isVietNamese': false,
    'isNative': false
  };
  final List<String> listNation = [
    'isVietNamese',
    'isNative',
  ];

  final Map<String, TextEditingController> controllers = Map.fromEntries(
    ['nameField', 'dateField', 'dateStartField', 'dateEndField'].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );

  @override
  void onInit() async {
    super.onInit();
    initData();
    getDataSchedule();
    debugPrint("Tutor Controller");

    Timer.periodic(const Duration(seconds: 1), (Timer t) => renderUpComming());
  }

  void initData() async {
    final res = await _tutorService.getAllTutorByPage();
    listTutor.value =
        (res['tutors']['rows'] as List).map((e) => Tutor.fromJson(e)).toList();
    debugPrint(listTutor.value.toString());
    // final resTotal = await _userService.getTotalTime();
    // totalTime.value = resTotal['total'];
  }

  void search() async {
    try {
      final res = await _tutorService.getAllTutorBySearch(
          // nationality: nationality,
          search: controllers['nameField']!.text,
          specialties: [
            // if (currentType.value != listType[0]) currentType.value,
          ]);
      listTutor.value =
          (res['rows'] as List).map((e) => Tutor.fromJson(e)).toList();
    } catch (e) {
      e.printError();
    }
  }

  void clearSearch() {
    controllers.forEach((key, value) {
      controllers[key]!.text = "";
    });
    valueContriesSelected.clear();
    nationality.forEach((key, value) {
      nationality[key] = false;
    });
    initData();
  }

//Todo: Navigate here
  void navigateTutorDetail(Tutor tutor) {
    // Get.toNamed(AppRoutes.TEACHER_DETAIL, arguments: {'id': tutor.userId});
  }

  void getDataSchedule({page = 1}) async {
    try {
      final res = await _userService.getSchedule(page: page);
      schedules.value = (res['data'] == null)
          ? []
          : (res['data']['rows'] as List)
              .map((e) => Schedule.fromJson(e))
              .toList();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void renderUpComming() {
    if (schedules.value.isNotEmpty) {
      int timeStart =
          schedules[0].scheduleDetailInfo?.scheduleInfo?.startTimestamp ?? 0;
      upComming.value = DateFormat("HH:mm ss").format(
          DateTime.fromMillisecondsSinceEpoch(
              timeStart - DateTime.now().millisecondsSinceEpoch));
    }
  }
}
