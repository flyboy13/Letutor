import 'package:flutter/material.dart';
import 'package:letutor/model/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      
    );
    // return LessonScheduleApp();
  }
}
