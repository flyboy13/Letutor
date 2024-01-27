// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:letutor/common/constant.dart';
import 'package:letutor/database/data/storage.dart';
import 'package:letutor/database/service/authen_api.dart';
import 'package:letutor/database/service/tutor_api.dart';
import 'package:letutor/screen/course_detail/course_detail.dart';
import 'package:letutor/screen/course_detail/course_detail_binding.dart';

import 'package:letutor/screen/courses/courses.dart';
import 'package:letutor/screen/courses/courses_binding.dart';
import 'package:letutor/screen/history%20screen/history_screen.dart';
import 'package:letutor/screen/history/history_page.dart';
import 'package:letutor/screen/history/history_page_binding.dart';
import 'package:letutor/screen/home%20screen/main_page.dart';
import 'package:letutor/screen/home%20screen/tutor_binding.dart';
import 'package:letutor/screen/login%20screen/signin_screen.dart';
import 'package:letutor/screen/pdf_view/pdf_binding.dart';
import 'package:letutor/screen/pdf_view/pdf_view.dart';
import 'package:letutor/screen/profile%20screen/components/profile_binding.dart';
import 'package:letutor/screen/profile%20screen/profile_page.dart';
import 'package:letutor/screen/review/review_binding.dart';
import 'package:letutor/screen/review/review_page.dart';
import 'package:letutor/screen/schedule%20screen/scheduel.dart';
import 'package:letutor/screen/schedule/schedule.dart';
import 'package:letutor/screen/schedule/schedule_binding.dart';
import 'package:letutor/screen/tutor%20detail/component/tutor_detail_binding.dart';
import 'package:letutor/screen/tutor%20detail/component/tutor_detail_component.dart';
import 'package:letutor/screen/tutor%20detail/tutor_detail.dart';
import 'package:letutor/screen/tutor%20detail/tutor_detail_controller.dart';
import '../database/service/user_api.dart';
import '../screen/error/error_screen.dart';
import '../screen/home screen/tutor_controller.dart';
import '../screen/home screen/tutor_screen.dart';
import '../screen/login screen/forgot.dart';
import '../screen/login screen/signup_screen.dart';

class BottomNavigate {
  static String tutor = '/tutor';
  static String courses = '/courses';
  static String scheduel = '/schedule';
  static String history = '/history';
  static String profile = '/profile';
}

class Routes {
  static final pages = <GetPage>[
    GetPage(
      name: '/signin',
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: '/signup',
      page: () => const SignUpScreen(),
      // binding: SignUpScreen(),
    ),
    GetPage(
      name: '/forgot',
      page: () => const ForgotScreen(),
      // binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: '/tutor',
      page: () {
        if (!Get.isRegistered<TutorApi>()) {
          Get.put(TutorApi());
        }
        if (!Get.isRegistered<UserApi>()) {
          Get.put(UserApi());
        }
        if (!Get.isRegistered<TutorController>()) {
          Get.put(TutorController());
        }
        return TutorScreen();
      },
      binding: TutorScreenBinding(),
    ),
    GetPage(
      name: '/tutor_detail',
      page: () {
        if (!Get.isRegistered<TutorDetailController>()) {
          Get.put(TutorDetailController());
        }
        if (!Get.isRegistered<TutorApi>()) {
          Get.put(TutorApi());
        }
        return const TutorDetailScreen();
      },
      binding: TutorDetailBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: "/courses",
      page: () => const Courses(),
      binding: CoursesBinding(),
    ),
    GetPage(
      name: '/schedule',
      page: () => const Schedule(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: '/history',
      page: () => const HistoryPage(),
      binding: HistoryPageBinding(),
    ),
    GetPage(
        name: '/course_detail',
        page: () => CourseDetail(),
        binding: CourseDetailBinding()),
    GetPage(
        name: API.feedback,
        page: () => const ReviewPage(),
        binding: ReviewBinding()),
    GetPage(
      name: "/pdf-view",
      page: () => const PdfView(),
      binding: PdfBinding(),
    ),
  ];
}
