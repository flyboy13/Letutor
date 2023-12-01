// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/list_chip.dart';
import 'package:letutor/model/card_info.dart';
import 'package:letutor/model/sample.dart';
import 'package:letutor/model/tutor.dart';
import 'package:letutor/model/userProfileButton.dart';
import 'package:letutor/screen/bottom bar/footer.dart';

import 'package:go_router/go_router.dart';

class TutorScreen extends StatefulWidget {
  const TutorScreen({Key? key}) : super(key: key);

  @override
  _TeacherPage createState() => _TeacherPage();
}

class _TeacherPage extends State<TutorScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final List<String> items = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];

  String? selectedValue;

  final TextEditingController textEditingController = TextEditingController();

  SampleTutor sampleTutor = SampleTutor();
  late List<InforCard> list;
  @override
  void initState() {
    super.initState();
    // You can use sampleTutor here
    list = SampleTutor.tutor
        .map((tutor) => InforCard(
              tutor: tutor,
              sampleTutor: sampleTutor,
            ))
        .toList();
  }

  void findTutor(String name) {
    print(name);
    // Search for a tutor with the given name
    // This is just a placeholder, replace with your actual search logic
    setState(() {
      list = SampleTutor.tutor
          .where(
              (tutor) => tutor.name.toLowerCase().contains(name.toLowerCase()))
          .map((tutor) => InforCard(tutor: tutor, sampleTutor: sampleTutor))
          .toList();
    });

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
                          fontSize: screenWidth * 0.02),
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
                              fontSize: screenWidth * 0.01),
                        ),
                        Text(
                          " (starts in 01:36:14)",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 235, 56),
                              fontSize: screenWidth * 0.01),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        ElevatedButton(
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
                          child: Row(children: [
                            Icon(Icons.smart_display_outlined,
                                size: screenWidth * 0.01,
                                color: Color.fromARGB(255, 0, 113, 240)),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Text(
                              'Enter lesson room',
                              style: TextStyle(
                                fontSize: screenWidth * 0.01,

                                color: Color.fromARGB(255, 0, 113,
                                    240), // Adjust the font size as needed
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      "Total lesson time is 509 hours 35 minutes",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: screenWidth * 0.01),
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
                        fontSize: screenWidth * 0.015,
                      ),
                    )),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: screenWidth * 0.3),
                    child: TextFormField(
                      onChanged: (val) {
                        findTutor(val);
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter tutor name...',

                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
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
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: screenWidth * 0.4),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,

                        hint: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),

                        items: items
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),

                        value: selectedValue,

                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },

                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: 200,
                        ),

                        dropdownStyleData: const DropdownStyleData(
                          maxHeight: 200,
                        ),

                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),

                        dropdownSearchData: DropdownSearchData(
                          searchController: textEditingController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: textEditingController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Search for an item...',
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return item.value.toString().contains(searchValue);
                          },
                        ),

                        //This to clear the search value when you close the menu

                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            textEditingController.clear();
                          }
                        },
                      ),
                    ),
                  ),
                ]),
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
                      style: TextStyle(fontSize: screenHeight * 0.03),
                    )),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Select a date',
                  ),
                  controller:
                      TextEditingController(text: selectedDate.toString()),
                  onChanged: onDateChanged,
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),

                // First column
                // Wrap(children: list)
                // LayoutBuilder(builder: (context, constraints) {
                //   if (constraints.maxWidth > 500) {
                //     // Display a horizontal layout
                //     return Row(children: list);
                //   } else {
                //     // Display a vertical layout
                //     return Column(children: list);
                //   }
                // }
                //     ),

                Wrap(
                    spacing: MediaQuery.of(context).size.width * 0.01,
                    runSpacing: MediaQuery.of(context).size.width * 0.01,
                    children: list)
              ]),
            ),
            Footer()
          ],
        ),
      ),
    );

    // Login Column
  }
}
