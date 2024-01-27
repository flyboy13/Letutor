import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/screen/tutor%20detail/component/tutor_detail_component.dart';
import 'package:letutor/screen/tutor%20detail/component/tutor_information_component.dart';
import 'package:letutor/screen/tutor%20detail/component/tutor_video_component.dart';

import 'tutor_detail_controller.dart';

class TutorDetailScreen extends GetWidget<TutorDetailController> {
  const TutorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(56.0), // Set the height of the AppBar here
        child: appbar(),
      ),
      body: Center(
        child: Obx(
          () => SingleChildScrollView(
            child: controller.isLoadingInit.value
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TutorInformationComponent(
                          controller: controller,
                        ),

                        controller.checkUrl
                            ? TutorVideoComponent(controller: controller)
                            : const SizedBox(),

                        const SizedBox(
                          height: 20,
                        ),
                        TutorDetailComponent(controller: controller),
                        const SizedBox(
                          height: 20,
                        ),
                        // ...controller.schedules.map(
                        //   (element) => BookingCourseComponent(
                        //     schedule: element,
                        //     isBooked: element.isBooked,
                        //     date: DateFormat('dd/MM/yyyy').format(
                        //         DateTime.fromMillisecondsSinceEpoch(
                        //             element.startTimestamp)),
                        //     time: element.startTime + '-' + element.endTime,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class DialogReportTeacher extends StatefulWidget {
  final TutorDetailController controller;
  final String teacherId;

  const DialogReportTeacher(
      {super.key, required this.controller, required this.teacherId});

  @override
  State<StatefulWidget> createState() {
    return DialogReportTeacherState();
  }
}

class DialogReportTeacherState extends State<DialogReportTeacher> {
  dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Report",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...widget.controller.reportTitleMap.entries.map(
            (e) => CheckboxListTile(
                title: Text(e.key),
                value: widget.controller.reportTitleMap[e.key],
                onChanged: (bool? value) {
                  setState(() {
                    widget.controller.reportTitleMap[e.key] = value!;
                    for (MapEntry<String, bool> item
                        in widget.controller.reportTitleMap.entries) {
                      if (widget.controller.reportTitleMap[item.key] == true) {
                        if (!widget.controller.reasonController.text
                            .contains("${e.key}\n")) {
                          widget.controller.reasonController.text +=
                              "${e.key}\n";
                        }
                      } else {
                        widget.controller.reasonController.text = widget
                            .controller.reasonController.text
                            .replaceAll("${item.key}\n", '');
                      }
                    }
                  });
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              maxLines: 5,
              controller: widget.controller.reasonController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                hintText: "Report",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.controller.reportTeacher(widget.teacherId);
                    Navigator.pop(context);
                  },
                  child: const Text("Report"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
