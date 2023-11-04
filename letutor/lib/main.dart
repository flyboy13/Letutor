import 'package:flutter/material.dart';
import 'package:letutor/screen/call%20screen/videocall.dart';
import 'package:letutor/screen/course%20detail/course_detail.dart';
import 'package:letutor/screen/discover%20courses/discover_screen.dart';
import 'package:letutor/screen/history%20screen/history_screen.dart';
import 'package:letutor/screen/login%20screen/signin_screen.dart';
import 'package:letutor/screen/home screen/home_screen.dart';
import 'package:letutor/screen/bottom%20bar/footer.dart';
import 'package:letutor/screen/schedule%20screen/scheduel.dart';
import 'package:letutor/model/card_info.dart';
import 'package:letutor/screen/teacher%20detail/teacher_detail.dart';
import 'package:letutor/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(home: VideoCallRoom());
    // return LessonScheduleApp();
  }
}
