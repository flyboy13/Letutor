import 'package:flutter/material.dart';
import 'package:letutor/screen/history%20screen/history_items.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
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
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'history.png',
                                width: screenWidth * 0.1,
                                height: screenHeight * 0.1,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 7,
                            child: Row(
                              children: [
                                const VerticalDivider(
                                  thickness: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: const Text(
                                        "History",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text(
                                        "The following is a list of lessons you have attended",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic,
                                          color: Color(0xff787878),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text(
                                        "You can review the details of the lessons you have attended",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic,
                                          color: Color(0xff787878),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                /* LIST BEGIN HERE */
                Container(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 0),
                    shrinkWrap: true,
                    primary: false,
                    children: [
                      createHistory("Nguyen Duc Tai", screenWidth),
                      createHistory("Keeran", screenWidth),
                      createHistory("Justin", screenWidth),
                      createHistory("John", screenWidth)
                      // HistoryListTile(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
