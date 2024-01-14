import 'package:get/get.dart';
import 'package:letutor/screen/course%20info/courses_controller.dart';

class CoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesController>(() => CoursesController());
  }
}
