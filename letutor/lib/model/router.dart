import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letutor/screen/course%20info/course_info.dart';
import 'package:letutor/screen/history%20screen/history_screen.dart';
import 'package:letutor/screen/home%20screen/main_page.dart';
import 'package:letutor/screen/login%20screen/signin_screen.dart';
import 'package:letutor/screen/profile%20screen/profile_page.dart';
import 'package:letutor/screen/schedule%20screen/scheduel.dart';
import 'package:letutor/screen/teacher%20detail/teacher_detail.dart';
import '../screen/error/error_screen.dart';
import '../screen/home screen/home_screen.dart';
import '../screen/login screen/forgot.dart';
import '../screen/login screen/signup_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _profileNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/signin',
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'signin',
      path: '/signin',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'signup',
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'forgot',
      path: '/forgot',
      builder: (BuildContext context, GoRouterState state) {
        return const ForgotScreen();
      },
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return MainPage(
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: '/tutor',
                builder: (BuildContext context, GoRouterState state) =>
                    const TutorScreen(),
                routes: [
                  GoRoute(
                    path: ':tutorid',
                    builder: (BuildContext context, GoRouterState state) {
                      String? id = state.pathParameters['tutorid'];
                      return TeacherDetailScreen(id);
                    },
                  ),
                ])
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/schedule',
              builder: (BuildContext context, GoRouterState state) {
                return const ScheduelScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/history',
              builder: (BuildContext context, GoRouterState state) {
                return const HistoryScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/courses',
              builder: (BuildContext context, GoRouterState state) {
                return const CourseInfor();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              parentNavigatorKey: _profileNavigatorKey,
              path: '/profile',
              builder: (BuildContext context, GoRouterState state) {
                return const ProfileScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (BuildContext context, GoRouterState state) {
    return const ErrorPage();
  },
);

// GoRouter configuration
