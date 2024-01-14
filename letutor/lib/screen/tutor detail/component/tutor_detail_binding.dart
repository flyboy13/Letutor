import 'package:get/get.dart';
import 'package:letutor/screen/tutor%20detail/tutor_detail_controller.dart';

class TutorDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TutorDetailController>(() => TutorDetailController());
  }
}
