import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import 'package:letutor/control/base_controller.dart';
import 'package:letutor/database/service/tutor_api.dart';
import 'package:letutor/database/service/user_api.dart';
import 'package:letutor/model/favourite_tutor.dart';
import 'package:letutor/model/schedule.dart';

import 'package:letutor/model/tutor.dart';

class TutorController extends BaseController {
  final tutorService = Get.find<TutorApi>();
  final _userService = Get.find<UserApi>();
  RxBool isLoading = false.obs;

  late Map body;

  RxString currentType = 'All'.obs;
  RxList<String> valueContriesSelected = <String>[].obs;
  RxList<FavouriteTutor> listFavouriteTutor = <FavouriteTutor>[].obs;
  RxList<Tutor> listTutor = <Tutor>[].obs;

  RxList<Schedule> schedules = <Schedule>[].obs;
  RxInt totalTime = 0.obs;
  Rx<String> upComming = ''.obs;

  RxInt pageSelected = 1.obs;
  RxInt totalPage = 9.obs;

  final listType = [
    'All',
    'English for kids',
    'English for Business',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS'
  ];

  Map listChip = {
    "All": "",
    'English for kids': "english-for-kids",
    'English for Business': "business-english",
    'Conversational': "conversational-english",
    'STARTERS': "starters",
    'MOVERS': "movers",
    'FLYERS': "flyers",
    'PET': "pet",
    'KET': "ket",
    'IELTS': "ielts",
    'TOEFL': "toefl",
    'TOEIC': "toeic"
  };

  var checkBox = false;
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
    if (!Get.isRegistered<TutorApi>()) {
      Get.put(TutorApi());
    }

    pageSelected = 1.obs;
    initData();
    getDataSchedule();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => renderUpComming());
    isLoading = false.obs;
  }

  void initData() async {
    final res = await tutorService.getAllTutorByPage();
    listTutor.value =
        (res['tutors']['rows'] as List).map((e) => Tutor.fromJson(e)).toList();
    listFavouriteTutor.value = (res['favoriteTutor'] as List).map((e) {
      FavouriteTutor favouriteTutor;
      try {
        favouriteTutor = FavouriteTutor.fromJson(e);
      } catch (e1) {
        favouriteTutor = FavouriteTutor();
      }
      // FavouriteTutor favouriteTutor = FavouriteTutor.fromJson(e);
      return favouriteTutor;
    }).toList();
    int total = res['tutors']['count'];
    totalPage.value = (total ~/ 9 + 1);
    final resTotal = await _userService.getTotalTime();
    totalTime.value = resTotal['total'];
    sortTutorList();
  }

  void search() async {
    try {
      final res = await tutorService.getAllTutorBySearch(body);
      int total = res['count'];
      totalPage.value = (total ~/ 9 + 1);
      listTutor.value =
          (res['rows'] as List).map((e) => Tutor.fromJson(e)).toList();
      update();
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

  final tutorApi = TutorApi();
//Todo: Navigate here
  Future<void> navigateTutorDetail(Tutor tutor) async {
    String id = tutor.userId;
    try {
      isLoading.value = true;
      // final res = await tutorApi.getTutorById(tutor.id);
      // final tutorDetail = Tutor.fromJson(res);

      await tutorApi.getTutorById(id);
      // await tutorApi.getTutorById(tutor.id);
    } catch (e) {
      e.printError();
    } finally {
      isLoading.value = false;
    }
    Get.toNamed('/tutor_detail', arguments: {'id': id});
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

  void manageTeacherFavorite(String id) {
    tutorService.manageTeacherFavorite(id);
  }

  bool favouriteTutor(String id) {
    for (var item in listFavouriteTutor) {
      if (item.secondId == id) {
        return true;
      }
    }
    return false;
  }

  void manageListFavouriteTutor(String id) {
    if (favouriteTutor(id)) {
      listFavouriteTutor.removeWhere((element) => element.secondId == id);
    } else {
      listFavouriteTutor.add(FavouriteTutor(secondId: id));
    }
  }

  void sortTutorList() {
    listTutor.sort((a, b) => a.rating.compareTo(b.rating) < 0 ? 1 : -1);
    listTutor.sort((a, b) => favouriteTutor(b.userId) ? 1 : -1);
  }

  void renderUpComming() {
 
    if (schedules.isNotEmpty) {
      int timeStart =
          schedules[0].scheduleDetailInfo?.scheduleInfo?.startTimestamp ?? 0;
      upComming = DateFormat("HH:mm ss").format(
          DateTime.fromMillisecondsSinceEpoch(
              timeStart - DateTime.now().millisecondsSinceEpoch)).obs;
    }
  }
}
