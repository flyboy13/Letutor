import 'package:get/get.dart';
import 'package:letutor/control/base_controller.dart';
import 'package:letutor/database/service/user_api.dart';
import 'package:letutor/model/schedule.dart';

class HistoryPageController extends BaseController {
  final _userService = Get.find<UserApi>();
  final RxList<Schedule> schedules = <Schedule>[].obs;
  @override
  void onInit() {
    super.onInit();
    getData(page: 1);
  }

  void getData({page = 1}) async {
    try {
      final res = await _userService.getSchedule(page: page);
      schedules.value = (res['data'] == null)
          ? []
          : (res['data']['rows'] as List)
              .map((e) => Schedule.fromJson(e))
              .toList();
      print(schedules.value);
    } catch (e) {
      print(e);
    }
  }
}
