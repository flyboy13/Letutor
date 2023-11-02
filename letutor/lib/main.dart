import 'package:flutter/material.dart';
import 'package:letutor/login%20screen/signin_screen.dart';
import 'package:letutor/home screen/home_screen.dart';
import 'package:letutor/bottom%20bar/footer.dart';
import 'package:letutor/tutor/card_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(home: HomePage());
  }
}
