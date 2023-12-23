import 'package:flutter/material.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';

class LevelEdit extends StatelessWidget {
  const LevelEdit({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    String? valueLevel = controller.controllers['levelField']?.text;
    if (valueLevel!.isEmpty) {
      valueLevel = 'BEGINNER';
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7, left: 5),
            child: const Text(
              "Level:",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          DropdownButtonFormField(
            value: valueLevel,
            isExpanded: true,
            items: [
              ...controller.levelUser.entries.map((e) => DropdownMenuItem(
                    value: e.key,
                    child: Text(
                      e.value,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
            ],
            onChanged: (Object? value) {
              controller.controllers['levelField']!.text = value.toString();
              debugPrint(controller.controllers['levelField']!.text);
              controller.update();
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
