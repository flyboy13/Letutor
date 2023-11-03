import 'package:flutter/material.dart';
import 'package:letutor/test.dart';

class ScheduelScreen extends StatefulWidget {
  const ScheduelScreen({Key? key}) : super(key: key);

  @override
  ScheduelScreenState createState() => ScheduelScreenState();
}

class ScheduelScreenState extends State<ScheduelScreen> {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Login Column
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "calendar.png",
                    width: screenWidth * 0.07,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Schedule",
                        style: TextStyle(
                          fontSize: screenWidth * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Here is a list of the sessions you have booked ",
                        style: TextStyle(fontSize: screenWidth * 0.01),
                      ),
                      Text(
                        "You can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours",
                        style: TextStyle(fontSize: screenWidth * 0.01),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Latest book",
                      style: TextStyle(fontSize: screenWidth * 0.02)),
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
                          style: TextStyle(fontSize: screenWidth * 0.015),
                        ),
                      ),
                      DataCell(
                        Text(
                          '0',
                          style: TextStyle(fontSize: screenWidth * 0.015),
                        ),
                      ),
                      DataCell(
                        Text(
                          'Not provided',
                          style: TextStyle(fontSize: screenWidth * 0.015),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // LayoutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
