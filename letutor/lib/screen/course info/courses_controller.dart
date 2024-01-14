import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:letutor/control/base_controller.dart';
import 'package:letutor/database/service/course_service.dart';
import 'package:letutor/model/category.dart';
import 'package:letutor/model/course.dart';


class CoursesController extends BaseController {
  Rx<int> index = 0.obs;
  final courseService = Get.find<CourseService>();

  Map<String, String> courseCategory = {};

  Map<String, List<Course>> courseMap = {};
  RxList<Course> courses = <Course>[].obs;
  RxBool isLoading = false.obs;
  final TextEditingController textController = TextEditingController();

  // RxInt countPage = 0.obs;

  RxInt pageSelected = 0.obs;
  RxInt totalPage = 7.obs;

  @override
  void onInit() async {
    super.onInit();
    await setUpData();
    print(courses.value);
  }

  onTapInDexTabBarCourses(int i) {
    index.value = i;
    courseMap = {};
    pageSelected = 0.obs;
    setUpData(page: 1);
  }

  Future<void> setUpData({int page = 1}) async {
    courseMap = {};
    pageSelected = 0.obs;
    searchCourses(page: page);
  }

  void searchCourses({int page = 1}) async {
    isLoading.value = true;
    try {
      final res = await courseService.getAllCourse(
          page: page, type: index.value, q: textController.text);
      int t = res['data']['count'];

      courses.value =
          (res['data']['rows'] as List).map((e) => Course.fromJson(e)).toList();
      totalPage.value = (t / 10).ceil();
      for (Course i in courses) {
        for (Category c in i.categories) {
          if (courseMap[c.key] != null) {
            courseMap[c.key]!.add(i);
          } else {
            courseMap[c.key] = [i];
          }
        }
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  void search(int page) {
    setUpData(page: page);
    print(courses.value);
  }
}
