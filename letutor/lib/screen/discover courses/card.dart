import 'package:flutter/material.dart';

class FlutterCourseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String level;
  final int lessonCount;
  final double screenWidth;

  const FlutterCourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.level,
    required this.lessonCount,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              width: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(level,
                          style: TextStyle(fontSize: screenWidth * 0.01)),
                      Text("$lessonCount Lessons",
                          style: TextStyle(fontSize: screenWidth * 0.01)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
