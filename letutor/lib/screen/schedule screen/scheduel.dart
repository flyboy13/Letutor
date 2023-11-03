import 'package:flutter/material.dart';

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
                children: [Text("List book")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
