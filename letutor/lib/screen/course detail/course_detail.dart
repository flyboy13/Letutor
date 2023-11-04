import 'package:flutter/material.dart';
import 'package:letutor/screen/bottom%20bar/footer.dart';

import 'package:letutor/screen/course detail/card.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  CourseDetailState createState() => CourseDetailState();
}

class CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidth * 0.05,
        title: Image.asset(
          "Let_logo.png",
          width: screenWidth * 0.15,
          // Adjust the logo width as needed
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Wrap(
                spacing: screenWidth * 0.01,
                children: [
                  Column(
                    children: [
                      FlutterCourseCardDetail(
                          imageUrl: "course2.png",
                          title: "Life in the Internet Age",
                          description:
                              "Let's discuss how technology is changing the way we live",
                          screenWidth: screenWidth)
                    ],
                  ),
                  Container(
                      width: screenWidth * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Overview"),
                          SizedBox(
                            height: screenWidth * 0.03,
                          ),
                          Wrap(children: [
                            Image.asset("question.png"),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            const Text("Why take this course"),
                          ]),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.02),
                              child: Text(
                                  "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.  ",
                                  softWrap: true))
                        ],
                      )),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
