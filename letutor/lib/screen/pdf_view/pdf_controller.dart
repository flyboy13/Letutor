// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:letutor/control/base_controller.dart';

class PdfController extends BaseController {
  String url = '';
  @override
  void onInit() {
    super.onInit();
    url = Get.arguments;
    print(Get.arguments);
  }
}
