// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/common/constant.dart';
import 'package:letutor/conponent/information_teacher_component.dart';
import 'package:letutor/database/service/tutor_api.dart';
import 'package:letutor/database/service/user_api.dart';
import 'package:letutor/model/router.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/list_chip.dart';
import 'package:letutor/model/tutor.dart';
import 'package:letutor/screen/home%20screen/tutor_controller.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';

class TutorScreen extends GetWidget<TutorController> {
  final List<String> _selectedItems = [];

  RxList<Tutor> listTutor = <Tutor>[].obs;

  TutorScreen({super.key});

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      "Foreign Tutor",
      "Vietnamese Tutor",
      "Native English Tutor"
    ];
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      Get.offNamed(BottomNavigate.tutor, preventDuplicates: false);
    }
    if (index == 1) {
      Get.offNamed(BottomNavigate.scheduel, preventDuplicates: false);
    }
    if (index == 2) {
      Get.toNamed(BottomNavigate.history);
    }
    if (index == 3) {
      Get.toNamed(BottomNavigate.courses);
    }
    if (index == 4) {
      Get.toNamed(BottomNavigate.profile);
    }

    _selectedIndex = index;
  }

  // Update UI

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    DateTime selectedDate = DateTime.now();

    List<String> listChip = [
      'All',
      'English for kids',
      'English for Business',
      'Conversational',
      'STARTERS',
      'MOVERS',
      'FLYERS',
      'PET',
      'KET',
      'IELTS',
      'TOEFL',
      'TOEIC'
    ];

    Widget listSpecialities = createListChip(listChip);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidth * 0.05,
        title: appbar(context),
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
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 9, 124, 255),
        unselectedItemColor: const Color.fromARGB(255, 180, 180, 180),
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 12, 61, 223),
                      Color.fromARGB(255, 5, 23, 157),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Text(
                      "Upcoming lesson",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: screenWidth * 0.06),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Thu, 26 Oct 23 00:00 - 00:25",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: screenWidth * 0.04),
                        ),
                        Text(
                          "(starts in 01:36:14)",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 235, 56),
                              fontSize: screenWidth * 0.04),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenHeight * 0.2,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your sign in logic here
                        },
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30.0), // set the border radius
                          ),
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.smart_display_outlined,
                                  size: screenWidth * 0.03,
                                  color: Color.fromARGB(255, 0, 113, 240)),
                              SizedBox(
                                width: screenWidth * 0.01,
                              ),
                              Text(
                                'Enter lesson room',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,

                                  color: Color.fromARGB(255, 0, 113,
                                      240), // Adjust the font size as needed
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      "Total lesson time is 509 hours 35 minutes",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: screenWidth * 0.04),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Find a tutor",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                    )),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: screenWidth * 0.47),
                    child: TextFormField(
                      onChanged: (val) {},
                      decoration: InputDecoration(
                        hintText: 'Enter tutor name...',

                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(),
                        ),

                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in the blank!";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: _showMultiSelect,
                        child: const Text('Select tutor nationality'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        children: _selectedItems
                            .map((e) => Chip(
                                  label: Text(e),
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                listSpecialities,
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Select available tutoring time:',
                      style: TextStyle(fontSize: screenHeight * 0.02),
                    )),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      labelText: 'Select a date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  controller:
                      TextEditingController(text: selectedDate.toString()),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Obx(() => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Column(children: [
                        // controller.listFavouriteTutor != []
                        //     ? Column(
                        //         children: [
                        //           ...controller.listFavouriteTutor.map(
                        //             (element) {
                        //               double tempRating;
                        //               if (element.tutorInfo?.rating == null) {
                        //                 tempRating = 0;
                        //               } else {
                        //                 tempRating = element.tutorInfo!.rating;
                        //               }
                        //               return InformationTeacherComponent(
                        //                 tutor: element.tutorInfo,
                        //                 controller: controller,
                        //                 countRating: tempRating,
                        //               );
                        //             },
                        //           )
                        //         ],
                        //       )
                        //     : SizedBox(
                        //         height: 0,
                        //       ),
                        ...controller.listTutor.map(
                          (element) {
                            return Column(
                              children: [
                                InformationTeacherComponent(
                                  tutor: element,
                                  controller: controller,
                                  countRating: element.rating.toDouble(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          },
                        )
                      ])),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: NumberPaginator(
                        config: NumberPaginatorUIConfig(
                          buttonShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          mode: ContentDisplayMode.numbers,
                        ),
                        onPageChange: (value) {
                          controller.pageSelected.value = value;
                          controller.search();
                        },
                        numberPages: controller.totalPage.value,
                        initialPage: controller.pageSelected.value,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );

    // Login Column
  }
}
