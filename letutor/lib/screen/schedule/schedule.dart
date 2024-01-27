import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/router.dart';
import 'package:number_paginator/number_paginator.dart';
import 'component/schedule_item.dart';
import 'schedule_controller.dart';

class Schedule extends GetWidget<ScheduleController> {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 1;

    void onItemTapped(int index) {
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

      selectedIndex = index;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(56.0), // Set the height of the AppBar here
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
        child: Obx(
          () => Column(
            children: [
              // const HeaderScheduleComponent(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/calendar.png",
                    width: 80,
                  ),
                  const VerticalDivider(
                    color: Colors.transparent,
                    width: 2,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Schedule",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 66, 66, 66)),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "Here is a list of the sessions you have booked\nYou can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours ",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              controller.schedules.isEmpty
                  ? const Text(
                      "You haven't book a class yet",
                      style: TextStyle(fontSize: 20),
                    )
                  : Column(
                      children: [
                        ...controller.schedules.map(
                          (element) => Column(
                            children: [
                              ScheduleItem(
                                schedule: element,
                                controller: controller,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              Padding(
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
                      controller.getData(page: value + 1);
                    },
                    numberPages: 9,
                    initialPage: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
