import 'package:get/get.dart';
import 'package:letutor/database/service/tutor_api.dart';
import 'package:letutor/database/service/user_api.dart';
import 'package:letutor/screen/home%20screen/tutor_controller.dart';

class TutorScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TutorApi());
    Get.put(UserApi());
    Get.put(TutorController());
  }
}
