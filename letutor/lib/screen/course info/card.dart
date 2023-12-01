import 'package:flutter/material.dart';

class FlutterCourseCardDetail extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  final double screenWidth;

  const FlutterCourseCardDetail({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              // width: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: screenWidth * 0.02,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: screenWidth * 0.01,
                  ),
                  Text(description,
                      style: TextStyle(fontSize: screenWidth * 0.01)),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // minimumSize: 200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        child: const Text("Discover"),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
