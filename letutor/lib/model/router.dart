import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letutor/screen/course%20info/course_info.dart';
import 'package:letutor/screen/history%20screen/history_screen.dart';
import 'package:letutor/screen/login%20screen/signin_screen.dart';
import 'package:letutor/screen/schedule%20screen/scheduel.dart';
import 'package:letutor/screen/teacher%20detail/teacher_detail.dart';

import '../screen/error/error_screen.dart';
import '../screen/home screen/home_screen.dart';
import '../screen/login screen/forgot.dart';
import '../screen/login screen/signup_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'signin',
      path: '/signin',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      name: 'signup',
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      name: 'forgot',
      path: '/forgot',
      builder: (BuildContext context, GoRouterState state) {
        return const ForgotScreen();
      },
    ),

    GoRoute(
        name: "tutor",
        path: '/tutor',
        builder: (BuildContext context, GoRouterState state) {
          return const TutorScreen();
        },
        routes: [
          GoRoute(
            name: "tutorDetail",
            path: ":id",
            builder: (BuildContext context, GoRouterState state) {
              return const TeacherDetailScreen();
            },
          ),
        ]),
    GoRoute(
      name: 'scheduel',
      path: '/scheduel',
      builder: (BuildContext context, GoRouterState state) {
        return const ScheduelScreen();
      },
    ),
    GoRoute(
      name: 'history',
      path: '/history',
      builder: (BuildContext context, GoRouterState state) {
        return const HistoryScreen();
      },
    ),
    GoRoute(
      name: 'courses',
      path: '/courses',
      builder: (BuildContext context, GoRouterState state) {
        return const CourseInfor();
      },
    ),
    // GoRoute(
    //   path: 'My courses',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const MyCourse();
    //   },
    // ),
  ],
  errorBuilder: (BuildContext context, GoRouterState state) {
    return const ErrorPage();
  },
);