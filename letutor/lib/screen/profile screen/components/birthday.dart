import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';

class BirthdayEdit extends StatelessWidget {
  const BirthdayEdit({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7, left: 5),
            child: const Text(
              "Birthday:",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
              readOnly: true,
              onTap: () {
                showDatePicker(
                        initialDatePickerMode: DatePickerMode.day,
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2050))
                    .then((value) => {
                          controller.controllers['birthdayField']?.text =
                              DateFormat("yyyy-MM-dd").format(value!)
                        });
              },
              controller: controller.controllers['birthdayField'],
              onChanged: (value) {}),
        ],
      ),
    );
  }
}
