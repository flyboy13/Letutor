// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letutor/model/appbar.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});
  @override
  ErrorPageState createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: appbar(context),
        ),
        body: Center(
          child: Column(children: [
            Image.asset(
              "assets/error.png",
              width: screenWidth * 0.15,
              // Adjust the logo width as needed
            ),
            ElevatedButton(
                onPressed: () {
                  print("clicked");
                  context.go('/tutor');
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // set the border radius
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text("Home"))
          ]),
        ));
  }
}
