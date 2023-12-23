import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/control/app.dart';
import 'package:letutor/screen/profile%20screen/components/label_custom.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';

class WantToLearnEdit extends StatelessWidget {
  const WantToLearnEdit({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    final topics = Get.find<App>().userModel.value?.getListWantToLearn() ?? [];

    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7, left: 5),
            child: const Text(
              "Want To Learn:",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: Wrap(spacing: 5.0, runSpacing: 5.0, children: [
              ...topics.map(
                (e) => LabelCustom(
                  content: e.name,
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
