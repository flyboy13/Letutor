import 'package:flutter/material.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';

class ContryEdit extends StatelessWidget {
  const ContryEdit({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
  
    String? valueContry = controller.controllers['countryField']?.text;
    if (valueContry!.isEmpty) {
      valueContry = 'VN';
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7, left: 5),
            child: const Text(
              "Contry:",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          DropdownButtonFormField(
            isExpanded: true,
            items: [
              const DropdownMenuItem(
    value: 'Vietnam',
    child: Text('Vietnam'),
  ),
              ...controller.languages.entries.map((e) => DropdownMenuItem(
                    value: e.key,
                    child: Text(
                      e.value,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
            ],
            onChanged: (Object? value) {
              controller.controllers['countryField']!.text = value.toString();
              controller.update();
            },
            value: valueContry,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
