import 'package:flutter/material.dart';
import 'package:letutor/screen/login%20screen/signin_screen.dart';
import 'package:letutor/screen/home screen/home_screen.dart';
import 'package:letutor/screen/bottom%20bar/footer.dart';
import 'package:letutor/screen/schedule%20screen/scheduel.dart';
import 'package:letutor/tutor/card_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(home: ScheduelScreen());
  }
}
