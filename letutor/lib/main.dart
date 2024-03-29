import 'package:flutter/material.dart';
import 'package:letutor/login_screen.dart';
import 'package:letutor/teacher_screen.dart';
import 'package:letutor/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(home: TeacherPage());
  }
}
