import 'package:get/get.dart';
import 'package:letutor/screen/review/review_controller.dart';


class ReviewBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<DashBoardListController>(() => DashBoardListController());
    Get.put(ReviewController());
  }
}

