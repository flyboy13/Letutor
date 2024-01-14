import 'package:get/get.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}