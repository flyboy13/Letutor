// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/calendar.dart';
import 'package:letutor/model/rate_comment.dart';
import 'package:letutor/model/sample.dart';
import 'package:letutor/model/tutor.dart';
import 'package:letutor/screen/teacher%20detail/data.dart';
import 'package:go_router/go_router.dart';

class TeacherDetailScreen extends StatefulWidget {
  TeacherDetailScreen(this.id, {super.key});

  String? id;
  @override
  State<TeacherDetailScreen> createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends State<TeacherDetailScreen> {
  late Tutor teacher;
  List<Tutor> sampleTutor = SampleTutor.tutor;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    teacher = findTutor(widget.id!);
    // print("country");
    // print(teacher.country);
    return Scaffold(
        appBar:
            AppBar(toolbarHeight: screenWidth * 0.05, title: appbar(context)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded(
                //     flex: 1,
                // child:
                Column(children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(teacher.image),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(teacher.name,
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                            Text(teacher.country,
                                style: const TextStyle(fontSize: 16)),
                            Row(children: [
                              ...List<Widget>.generate(
                                teacher.rate,
                                (index) =>
                                    const Icon(Icons.star, color: Colors.amber),
                              ),
                              const SizedBox(width: 8),
                              // Text('(${teacher.reviewCount})',
                              //     style: const TextStyle(fontSize: 18))
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(teacher.detail,
                        style: const TextStyle(fontSize: 16)),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              teacher.toggleLove();
                            });
                          },
                          child: Column(
                            children: [
                              Icon(
                                teacher.love
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: teacher.love ? Colors.red : Colors.blue,
                              ),
                              Text(
                                'Favorite',
                                style: TextStyle(
                                  color:
                                      teacher.love ? Colors.red : Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: TextButton(
                      //     onPressed: () {
                      //       // Navigator.pushNamed(context, Routes.review);
                      //     },
                      //     child: const Column(
                      //       children: [
                      //         Icon(Icons.reviews_outlined, color: Colors.blue),
                      //         Text('Review',
                      //             style: TextStyle(color: Colors.blue))
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: TextButton(
                          onPressed: () async {
                            await showReportDialog(context);
                          },
                          child: const Column(
                            children: [
                              Icon(Icons.report_outlined, color: Colors.blue),
                              Text('Report',
                                  style: TextStyle(color: Colors.blue))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
                // Column(
                //   children: [
                //     Container(
                //       margin: const EdgeInsets.symmetric(vertical: 8),
                //       height: 500,
                //       alignment: Alignment.center,
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.blue, width: 2),
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(10))),
                //       child: Text(
                //         'Video',
                //         style: TextStyle(
                //           fontSize: 22,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.blue[700],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 8),
                Text('Languages',
                    style: TextStyle(
                        fontSize: screenWidth * 0.012,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(children: [
                    Chip(
                      label: const Text(
                        'English',
                        style: TextStyle(color: Colors.blue),
                      ),
                      backgroundColor: Colors.blue[50],
                    ),
                  ]),
                ),
                const SizedBox(height: 8),
                Text('Specialties',
                    style: TextStyle(
                        fontSize: screenWidth * 0.012,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: -4,
                    children: List<Widget>.generate(
                      teacher.specialties.length,
                      (index) => Chip(
                        label: Text(
                          teacher.specialties[index],
                          style: const TextStyle(color: Colors.blue),
                        ),
                        backgroundColor: Colors.blue[50],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text('Suggested Courses',
                    style: TextStyle(
                        fontSize: screenWidth * 0.012,
                        fontWeight: FontWeight.bold)),
                ...courses.map((course) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Text(course.name,
                              style: TextStyle(
                                fontSize: screenWidth * 0.01,
                              )),
                          const SizedBox(width: 16),
                          TextButton(
                              onPressed: () => context.go('/coursedetails'),
                              child: const Text('View'))
                        ],
                      ),
                    )),
                const SizedBox(height: 12),
                Text('Interests',
                    style: TextStyle(
                        fontSize: screenWidth * 0.012,
                        fontWeight: FontWeight.bold)),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 8),
                  child: Text('I loved the weather, the scenery and the '
                      'laid-back lifestyle of the locals.'),
                ),
                const SizedBox(height: 12),
                Text('Teaching Experiences',
                    style: TextStyle(
                        fontSize: screenWidth * 0.012,
                        fontWeight: FontWeight.bold)),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 8),
                  child: Text(
                      'I have more than 10 years of teaching english experience'),
                ),
                Center(
                    child: SizedBox(
                        width: screenWidth * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 12),
                          child: OutlinedButton(
                            style: TextButton.styleFrom(
                                minimumSize: const Size.fromHeight(0),
                                padding: const EdgeInsets.all(15),
                                side: const BorderSide(
                                    color: Colors.blue, width: 1.5)),
                            onPressed: () async {
                              final selectedDate =
                                  await bookLearningDate(context);
                              if (mounted) {
                                await bookLearningHour(context, selectedDate!);
                              }
                              // Navigator.pushNamed(context, Routes.booking);
                            },
                            child: const Text(
                              'Book This Tutor',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                          ),
                        ))),
                const CalendarModel(),
                ListView.builder(
                  itemCount: teacher.feedbacks.length,
                  itemBuilder: (context, index) {
                    return RateAndComment(feedback: teacher.feedbacks[index]);
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ));
  }
}

Future<DateTime?> bookLearningDate(BuildContext context) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2050),
  );
  return selectedDate ?? DateTime.now();
}

Future<void> bookLearningHour(
    BuildContext context, DateTime selectedDate) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    elevation: 5,
    clipBehavior: Clip.hardEdge,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    builder: (context) {
      return SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose Your Time',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(24),
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 32,
                  childAspectRatio: 3,
                  children: List<Widget>.generate(
                    courseHours.length,
                    (index) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () async {
                        final dialogResult =
                            await showBookingConfirmDialog(context);
                        if (dialogResult) {
                          // Navigator.of(context).pushNamed(
                          //   Routes.bookingDetail,
                          //   arguments: {
                          //     'selectedDate': selectedDate,
                          //     'selectedHour': courseHours[index],
                          //     'weekday': selectedDate.weekday
                          //   },
                          // );

                          // GoRouter.of(context).go('/booking_detail');
                        }
                      },
                      child: Text(
                        courseHours[index],
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<bool> showBookingConfirmDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Book Tutor'),
        content: const Text('Are you sure to book this tutor at this time?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('CANCEL')),
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('YES')),
        ],
      );
    },
  ).then((value) => value ?? false);
}

Tutor findTutor(String id) {
  List<Tutor> sampleTutor = SampleTutor.tutor;
  for (var t in sampleTutor) {
    if (t.id == id) {
      return t;
    }
  }
  return sampleTutor.last;
}

Future<bool> showReportDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Report Tutor'),
        content: const Text('Are you sure to report this tutor?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('CANCEL')),
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('YES')),
        ],
      );
    },
  ).then((value) => value ?? false);
}
