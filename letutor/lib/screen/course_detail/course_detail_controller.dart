import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/control/base_controller.dart';
import 'package:letutor/model/topic.dart';

import '../../model/course.dart';

class CourseDetailController extends BaseController {
  late Course course;

  final levels = [
    '',
    'Beginner',
    'Upper beginner',
    'Pre-intermediate',
    'Intermediate',
    'Upper intermediate'
  ];

  @override
  void onInit() {
    super.onInit();
    course = Get.arguments[0];
    print(course);
  }

  void handlePdfView(Topic e) {
    Get.toNamed("/pdf-view", arguments: e.nameFile);
  }
}
