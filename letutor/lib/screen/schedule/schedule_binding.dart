import 'package:get/get.dart';
import 'package:letutor/screen/schedule/schedule_controller.dart';


class ScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(() => ScheduleController());
  }
}