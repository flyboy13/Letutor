// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/database/service/tutor_api.dart';
import 'package:letutor/database/service/user_api.dart';

import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/list_chip.dart';
import 'package:letutor/model/card_info.dart';
import 'package:letutor/model/multiple_select.dart';
import 'package:letutor/model/tutor.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';

class TutorScreen extends StatefulWidget {
  const TutorScreen({super.key});

  @override
  TutorScreenState createState() => TutorScreenState();
}

class TutorScreenState extends State<TutorScreen> {
  List<String> _selectedItems = [];
  final _tutor = TutorApi();
  final _user = UserApi();

  RxList<Tutor> listTutor = <Tutor>[].obs;
  @override
  void initState() {
    super.initState();
    initData();
    Get.put(ProfileController());
  }

  void initData() async {
    final res = await _tutor.getAllTutorByPage();
    listTutor.value =
        (res['tutors']['rows'] as List).map((e) => Tutor.fromJson(e)).toList();
  }

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      "Foreign Tutor",
      "Vietnamese Tutor",
      "Native English Tutor"
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  String? selectedValue;

  final TextEditingController textEditingController = TextEditingController();

  // SampleTutor sampleTutor = SampleTutor();
  // late List<InforCard> list;
  // void initState() {
  //   super.initState();
  //   // You can use sampleTutor here
  //   // list = SampleTutor.tutor
  //   //     .map((tutor) => InforCard(
  //   //           tutor: tutor,
  //   //           sampleTutor: sampleTutor,
  //   //         ))
  //   //     .toList();
  // }

  void findTutor(String input) {
    setState(
      () {
        // list = SampleTutor.tutor
        //     .where((tutor) =>
        //         tutor.name.toLowerCase().contains(input.toLowerCase()) ||
        //         tutor.country.toLowerCase().contains(input.toLowerCase()))
        //     .map((tutor) => InforCard(tutor: tutor))
        //     .toList();
      },
    );

    // Do something with the found tutor
  }

  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double screenHeight = MediaQuery.of(context).size.height;

    DateTime selectedDate = DateTime.now();

    void onDateChanged(String date) {
      setState(() {
        selectedDate = DateTime.parse(date);
      });
    }

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
                      onChanged: (val) {
                        findTutor(val);
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
                  onChanged: onDateChanged,
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                // Wrap(
                //     spacing: MediaQuery.of(context).size.width * 0.01,
                //     runSpacing: MediaQuery.of(context).size.width * 0.01,
                //     children: list)
              ]),
            ),
          ],
        ),
      ),
    );

    // Login Column
  }
}
