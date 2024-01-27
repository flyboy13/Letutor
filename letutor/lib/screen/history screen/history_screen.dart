import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/router.dart';
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

    int selectedIndex = 2;

    void onItemTapped(int index) {
      if (index == 0) {
        Get.offNamed(BottomNavigate.tutor);
      }
      if (index == 1) {
        Get.offNamed(BottomNavigate.scheduel);
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
          currentIndex: selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 9, 124, 255),
          unselectedItemColor: const Color.fromARGB(255, 180, 180, 180),
          onTap: onItemTapped,
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
                        'assets/history.png',
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
