// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/font_text.dart';
import 'package:letutor/model/router.dart';
import 'package:letutor/model/title_string.dart';
import 'package:number_paginator/number_paginator.dart';

import 'component/header_courses_component.dart';
import 'component/search_courses_component.dart';
import 'component/tab_courses_view.dart';
import 'courses_controller.dart';

class Courses extends GetWidget<CoursesController> {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 3;

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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderCoursesComponent(),
              const SizedBox(
                height: 20,
              ),
              Text(
                TitleString.courseDescription,
                style: text15.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              //search courses
              SearchCoursesComponent(),
              const SizedBox(
                height: 20,
              ),
              TabCourseView(controller: controller),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => controller.totalPage == 0
                    ? Center(
                        child: Text(TitleString.noData),
                      )
                    : Padding(
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
                              controller
                                  .search(controller.pageSelected.value + 1);
                            },
                            numberPages: controller.totalPage.value,
                            initialPage: controller.pageSelected.value,
                          ),
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
