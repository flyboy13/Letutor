import 'package:get/get.dart';
import 'package:letutor/control/base_controller.dart';
import 'package:letutor/database/service/tutor_api.dart';
import 'package:letutor/model/review.dart';


class ReviewController extends BaseController {
  bool isHaveDrawer = true;

  final _tutorService = Get.find<TutorApi>();

  String tutorId = '';
  RxList<Review> reviews = <Review>[].obs;
  RxBool isLoading = true.obs;
  RxInt pageSelected = 0.obs;
  RxInt totalPage = 7.obs;

  @override
  void onInit() {
    super.onInit();
    tutorId = Get.arguments['id'];
    getData(page: 1);
    isLoading = false.obs;
  }

  void getData({required int page}) async {
    try {
      final res = await _tutorService.getReviewByTeacherId(tutorId, page: page);
      final data = res['data']['rows'];
      reviews.value = (data == null)
          ? []
          : (data as List).map((e) => Review.fromJson(e)).toList();
      int total = res['data']['count'];
      totalPage = (total ~/ 10 + 1).obs;
    } catch (e) {
      e.printError();
    }
  }
}
