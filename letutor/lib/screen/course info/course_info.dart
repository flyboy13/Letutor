import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/router.dart';

import 'package:letutor/screen/course%20info/card.dart';

class CourseInfor extends StatefulWidget {
  const CourseInfor({super.key});

  @override
  CourseInforState createState() => CourseInforState();
}

class CourseInforState extends State<CourseInfor> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    int selectedIndex = 3;

    void onItemTapped(int index) {
      if (index == 0) {
        Get.offNamed(BottomNavigate.tutor, preventDuplicates: false);
      }
      if (index == 1) {
        Get.offNamed(BottomNavigate.scheduel, preventDuplicates: false);
      }
      if (index == 2) {
        Get.offNamed(BottomNavigate.history);
      }
      if (index == 3) {
        Get.offNamed(BottomNavigate.courses);
      }
      if (index == 4) {
        Get.offNamed(BottomNavigate.profile);
      }

      selectedIndex = index;
    }

    List<String> courseTitles = [
      "The Internet",
      "Artificial Intelligence (AI)",
      "Social Media",
      "Internet Privacy",
      "Live Streaming",
      "Coding",
      "Technology Transforming Healthcare",
      "Smart Home Technology",
      "Remote Work - A Dream Job?",
    ];
    int count = 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidth * 0.06,
        title: Wrap(
          children: [appbar(context)],
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Tutor',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
            ),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 9, 124, 255),
        unselectedItemColor: const Color.fromARGB(255, 180, 180, 180),
        onTap: onItemTapped,
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
                          imageUrl: "assets/course2.png",
                          title: "Life in the Internet Age",
                          description:
                              "Let's discuss how technology is changing the way we live",
                          screenWidth: screenWidth)
                    ],
                  ),
                  SizedBox(
                      width: screenWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Overview",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenWidth * 0.03,
                          ),
                          Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/question.png",
                                  width: screenWidth * 0.02,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.01,
                                ),
                                const Text("Why take this course",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.02),
                              child: const Text(
                                  "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.  ",
                                  softWrap: true)),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/question.png",
                                  width: screenWidth * 0.02,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.01,
                                ),
                                const Text("What will you be able to do",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.02),
                              child: const Text(
                                  "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.  ",
                                  softWrap: true)),
                          SizedBox(
                            height: screenWidth * 0.03,
                          ),
                          const Text(
                            "List Topics",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Wrap(
                            children: courseTitles.map((courseTitle) {
                              count += count + 1;
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("$count ."),
                                      Text(courseTitle,
                                          style:
                                              const TextStyle(fontSize: 18.0)),
                                      const SizedBox(height: 10.0),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Wrap(
                spacing: screenWidth * 0.01,
                children: [
                  Column(
                    children: [
                      FlutterCourseCardDetail(
                          imageUrl: "assets/course1.png",
                          title: "Life in the Internet Age",
                          description:
                              "Let's discuss how technology is changing the way we live",
                          screenWidth: screenWidth)
                    ],
                  ),
                  SizedBox(
                      width: screenWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Overview",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenWidth * 0.03,
                          ),
                          Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/question.png",
                                  width: screenWidth * 0.02,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.01,
                                ),
                                const Text("Why take this course",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.02),
                              child: const Text(
                                  "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.  ",
                                  softWrap: true)),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/question.png",
                                  width: screenWidth * 0.02,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.01,
                                ),
                                const Text("What will you be able to do",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.02),
                              child: const Text(
                                  "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.  ",
                                  softWrap: true)),
                          SizedBox(
                            height: screenWidth * 0.03,
                          ),
                          const Text(
                            "List Topics",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Wrap(
                            children: courseTitles.map((courseTitle) {
                              count += count + 1;
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("$count ."),
                                      Text(courseTitle,
                                          style:
                                              const TextStyle(fontSize: 18.0)),
                                      const SizedBox(height: 10.0),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Wrap(
                spacing: screenWidth * 0.01,
                children: [
                  Column(
                    children: [
                      FlutterCourseCardDetail(
                          imageUrl: "assets/lesson.png",
                          title: "Life in the Internet Age",
                          description:
                              "Let's discuss how technology is changing the way we live",
                          screenWidth: screenWidth)
                    ],
                  ),
                  SizedBox(
                      width: screenWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Overview",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenWidth * 0.03,
                          ),
                          Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/question.png",
                                  width: screenWidth * 0.02,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.01,
                                ),
                                const Text("Why take this course",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.02),
                              child: const Text(
                                  "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.  ",
                                  softWrap: true)),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/question.png",
                                  width: screenWidth * 0.02,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.01,
                                ),
                                const Text("What will you be able to do",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.02),
                              child: const Text(
                                  "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.  ",
                                  softWrap: true)),
                          SizedBox(
                            height: screenWidth * 0.03,
                          ),
                          const Text(
                            "List Topics",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenWidth * 0.01,
                          ),
                          Wrap(
                            children: courseTitles.map((courseTitle) {
                              count += count + 1;
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("$count ."),
                                      Text(courseTitle,
                                          style:
                                              const TextStyle(fontSize: 18.0)),
                                      const SizedBox(height: 10.0),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
