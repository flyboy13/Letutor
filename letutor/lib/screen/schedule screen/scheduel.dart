import 'package:flutter/material.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/calendar.dart';
import 'package:letutor/screen/schedule screen/scheduel_items.dart';

class ScheduelScreen extends StatefulWidget {
  const ScheduelScreen({super.key});

  @override
  ScheduelScreenState createState() => ScheduelScreenState();
}

class ScheduelScreenState extends State<ScheduelScreen> {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidth * 0.05,
        title: Wrap(
          children: [appbar(context)],
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Column(
            children: [
              // Login Column
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "calendar.png",
                    width: screenWidth * 0.3,
                  ),
                  VerticalDivider(
                    color: Colors.transparent,
                    width: screenWidth * 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Schedule",
                        style: TextStyle(
                            fontSize: screenWidth * 0.07,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 66, 66, 66)),
                      ),
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: Text(
                          "Here is a list of the sessions you have booked\nYou can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours ",
                          style: TextStyle(fontSize: screenWidth * 0.027),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.012,
              ),
              Row(
                children: [
                  Text("Latest book",
                      style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: screenWidth * 0.02),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Page',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: screenWidth * 0.02),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Description',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: screenWidth * 0.02),
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          'sample.pdf',
                          style: TextStyle(fontSize: screenWidth * 0.02),
                        ),
                      ),
                      DataCell(
                        Text(
                          '0',
                          style: TextStyle(fontSize: screenWidth * 0.02),
                        ),
                      ),
                      DataCell(
                        Text(
                          'Not provided',
                          style: TextStyle(fontSize: screenWidth * 0.02),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // LayoutWidget(),
              SizedBox(
                height: screenWidth * 0.012,
              ),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Wrap(
                    // spacing: 50,
                    runSpacing: 20,
                    children: List.generate(
                        3, (index) => createScheduel("Tai", screenWidth))),
              ),
              const CalendarModel(),
            ],
          ),
        ),
      ),
    );
  }
}
