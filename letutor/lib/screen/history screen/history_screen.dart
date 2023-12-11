import 'package:flutter/material.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/screen/history%20screen/history_items.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: screenWidth * 0.05,
          title: Wrap(
            children: [appbar(context)],
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
                      Image.asset(
                        'history.png',
                        width: screenWidth * 0.27,
                      ),
                      VerticalDivider(
                        color: Colors.transparent,
                        width: screenWidth * 0.03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "History",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.07,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 66, 66, 66)),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.6,
                            child: Text(
                              "The following is a list of lessons you have  \n You can review the details of the lessons you have attended  ",
                              style: TextStyle(
                                fontSize: screenWidth * 0.027,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
                /* LIST BEGIN HERE */
                ListView(
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
                )
              ],
            ),
          ),
        ));
  }
}
