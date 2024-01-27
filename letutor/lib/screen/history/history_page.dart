import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/router.dart';
import 'package:letutor/screen/history/history_page_controller.dart';

import 'component/header_history_component.dart';
import 'component/history_item_component.dart';

class HistoryPage extends GetWidget<HistoryPageController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          () => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const HeaderHistoryComponent(),
                const SizedBox(
                  height: 20,
                ),
                ...controller.schedules.map(
                  (element) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HistoryItemComponent(
                        schedule: element,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
