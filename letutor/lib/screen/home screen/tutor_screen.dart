// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:letutor/conponent/information_teacher_component.dart';
import 'package:letutor/model/router.dart';
import 'package:letutor/screen/meeting/video_meeting.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:letutor/model/appbar.dart';

import 'package:letutor/model/tutor.dart';
import 'package:letutor/screen/home%20screen/tutor_controller.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';

class TutorScreen extends GetWidget<TutorController> {
  final List<String> _selectedItems = [];

  RxList<Tutor> listTutor = <Tutor>[].obs;

  TutorScreen({super.key});

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
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

    // Map listChip = {

    //   'English for kids': "english-for-kids",
    //   'English for Business': "business-english",
    //   'Conversational':"conversational-english",
    //   'STARTERS': "starters",
    //   'MOVERS': "movers",
    //   'FLYERS': "flyers",
    //   'PET': "pet",
    //   'KET': "ket",
    //   'IELTS':"ielts",
    //   'TOEFL': "toefl",
    //   'TOEIC': "toeic"
    // };

    // Widget listSpecialities = createListChip(listChip);
    String name = "";
    RxString selectedSpecialities = "".obs;

    RxList selectNations = [].obs;
    RxString spec = "".obs;

    List nations = [
      "Foreign Tutor",
      "Vietnamese Tutor",
      "Native English Tutor"
    ];

    List<MultiSelectItem<String?>> items = nations
        .map((nation) => MultiSelectItem<String?>(nation, nation))
        .toList();

    void search() async {
      Map nationTemp = {};
      print("nation: $selectNations");
      if (selectNations.contains("Foreign Tutor")) {
        nationTemp = {"isVietNamese": false};
      }
      if (selectNations.contains("Vietnamese Tutor")) {
        nationTemp = {"isVietNamese": true};
      }
      if (selectNations.contains("Native English Tutor")) {
        nationTemp = {"isNative": true};
      }
      if (selectNations.contains("Foreign Tutor") &
          selectNations.contains("Vietnamese Tutor") &
          selectNations.contains("Native English Tutor")) {
        nationTemp = {};
      }
      try {
        controller.body = {
          "filters": {
            "nationality": nationTemp,
            "specialties": [selectedSpecialities.value],
          },
          "page": controller.pageSelected.value,
          "perPage": 9,
          "search": name
        };

        print("Controller.body = ${controller.body}");
        controller.search();

        // controller.update();
      } catch (e) {
        e.printError();
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(56.0), // Set the height of the AppBar here
        child: appbar(),
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
                          DateFormat('dd/MM/yyyy').format(DateTime.now()),
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: screenWidth * 0.04),
                        ),
                        Text(
                          controller.upComming.value != ""
                              ? '(còn ${controller.upComming.value})'
                              : '',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 203, 61),
                              fontSize: screenWidth * 0.04),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                      ],
                    ),
                    Obx(
                      () => Text(
                        'Total time ${controller.totalTime.value ~/ 60} hours ${controller.totalTime.value % 60} minutes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenHeight * 0.2,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your sign in logic here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoMeeting(
                                    studentMeetingLink: controller
                                        .schedules[0].studentMeetingLink)),
                          );
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
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Enter tutor name: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
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
                      onChanged: (val) {
                        name = val;
                        print(name);
                      },
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
                SizedBox(
                  width: 500,
                  child: MultiSelectChipField(
                    items: items,
                    title: Text(
                      "Select tutor nationality",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    headerColor: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.1),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    selectedChipColor: Colors.blue.withOpacity(1),
                    selectedTextStyle: TextStyle(color: Colors.blue[800]),
                    onTap: (List<String?>? selectedItems) {
                      // Handle selected items here if needed
                      if (selectedItems != null) {
                        selectNations.clear();
                        for (String? select in selectedItems) {
                          if (select != null) {
                            // Perform actions based on selected values
                            selectNations.add(select);
                          }
                        }
                      }
                      // Perform actions based on selected values
                      print("Selected items: ${selectNations.value}");

                      // For example, you can update another RxList with the selected values
                      // selectedNations.assignAll(selectedValues);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Wrap(
                //     children: _selectedItems
                //         .map((e) => Chip(
                //               label: Text(e),
                //             ))
                //         .toList(),
                //   ),
                // ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                // listSpecialities,
                // ,
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Select course: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                      ),
                    )),

                Obx(() => Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: controller.listChip.entries
                          .map((e) => GestureDetector(
                                onTap: () {
                                  selectedSpecialities.value = e.value;

                                  print(
                                      "selectedSpec: ${selectedSpecialities.value}");
                                  print(
                                      "Status: ${selectedSpecialities.value == e.value}");
                                },
                                child: Chip(
                                  label: Text(e.key),
                                  labelStyle: TextStyle(
                                    color: selectedSpecialities.value == e.value
                                        ? Color.fromARGB(255, 18, 129, 255)
                                        : Colors.black,
                                    backgroundColor: selectedSpecialities
                                                .value ==
                                            e.value
                                        ? Color.fromARGB(255, 255, 255, 255)
                                        : Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ))
                          .toList(),
                    )),

                SizedBox(
                  height: screenHeight * 0.03,
                ),
                // Align(
                //     alignment: Alignment.bottomLeft,
                //     child: Text(
                //       'Select available tutoring time:',
                //       style: TextStyle(fontSize: screenHeight * 0.02),
                //     )),
                // SizedBox(
                //   height: screenHeight * 0.02,
                // ),
                // TextField(
                //   keyboardType: TextInputType.datetime,
                //   decoration: InputDecoration(
                //       labelText: 'Select a date',
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //       )),
                //   controller:
                //       TextEditingController(text: selectedDate.toString()),
                // ),

                SizedBox(
                  height: 50.0,
                  child: OutlinedButton(
                    onPressed: () {
                      search();
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Search",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
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
                        initialPage: 0,
                      ),
                    ),
                  ),
                  // ),
                )
              ]),
            ),
          ],
        ),
      ),
    );

    // Login Column
  }
}
