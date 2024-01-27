// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:letutor/control/base_controller.dart';
import 'package:letutor/database/service/user_api.dart';
import 'package:letutor/model/schedule.dart';

class ScheduleController extends BaseController {
  final _userService = Get.find<UserApi>();
  final RxList<Schedule> schedules = <Schedule>[].obs;

  RxInt pageSelected = 0.obs;
  RxInt totalPage = 7.obs;

  final TextEditingController textController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData({page = 1}) async {
    try {
      final res = await _userService.getSchedule(page: page);
      int t = res['data']['count'] ?? 10;
      totalPage.value = (t / 10).ceil();
      schedules.value = (res['data'] == null)
          ? []
          : (res['data']['rows'] as List)
              .map((e) => Schedule.fromJson(e))
              .toList();
    } catch (e) {
      print(e);
    }
  }

  void handleCancel(Schedule schedule, int i) async {
    try {
      final res = await _userService.cancelSchedule(
          scheduleDetailId: schedule.scheduleDetailInfo!.id, i: i);
    } catch (e) {
      print(e);
    }
  }
}
