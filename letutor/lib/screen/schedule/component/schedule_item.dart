// ignore_for_file: unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:letutor/common/constant.dart';
import 'package:letutor/conponent/circle_box.dart';
import 'package:letutor/conponent/image_network_component.dart';
import 'package:letutor/model/schedule.dart';
import 'package:letutor/screen/meeting/video_meeting.dart';
import 'package:letutor/screen/schedule/schedule_controller.dart';

class ScheduleItem extends StatelessWidget {
  final Schedule schedule;
  final ScheduleController controller;

  const ScheduleItem(
      {super.key, required this.schedule, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
        },
        children: <TableRow>[
          TableRow(children: <Widget>[
            SizedBox(
              height: 250,
              child: Column(
                children: [
                  Text(DateFormat('dd/MM/yyyy').format(
                      DateTime.fromMillisecondsSinceEpoch(schedule
                          .scheduleDetailInfo!.scheduleInfo!.startTimestamp))),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Column(
                children: [
                  CircleBox(
                    size: 80,
                    child: ImageNetworkComponent(
                      url: schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                              ?.user?.avatar ??
                          '',
                    ),
                  ),
                  Text(
                    schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo!.user!
                            .name ??
                        "No name",
                    style: const TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        schedule.scheduleDetailInfo?.scheduleInfo?.startTime ??
                            "",
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        " - ",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        schedule.scheduleDetailInfo?.scheduleInfo?.endTime ??
                            "",
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          schedule.studentRequest.isEmpty
                              ? ""
                              : schedule.studentRequest,
                          style: const TextStyle(fontSize: 14),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoMeeting(
                                        studentMeetingLink:
                                            schedule.studentMeetingLink)),
                              );
                            },
                            child: const Text("Enter Class")),
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DialogCancelClass(
                                      controller: controller,
                                      schedule: schedule,
                                    );
                                  });
                            },
                            child: const Text("Cancle"))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class DialogCancelClass extends StatefulWidget {
  final ScheduleController controller;
  final Schedule schedule;

  const DialogCancelClass(
      {super.key, required this.controller, required this.schedule});

  @override
  State<StatefulWidget> createState() {
    return DialogCancelClassState();
  }
}

class DialogCancelClassState extends State<DialogCancelClass> {
  dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
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
            " Reason Cancel Class",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: const Text("What Is Your Reason For Canceling This Class"),
              items: [
                ...reasonCancelClassTitleMap.entries
                    .map((e) => DropdownMenuItem(
                          value: e.key,
                          child: Text(e.value,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14)),
                        ))
              ],
              onChanged: (Object? value) {
                widget.controller.textController.text = value.toString();
              },
              value: widget.controller.textController.text != ''
                  ? widget.controller.textController.text
                  : null,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              maxLines: 5,
              controller: widget.controller.reasonController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                hintText: "ExtraNotes",
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
                    widget.controller.handleCancel(
                        widget.schedule,
                        int.tryParse(widget.controller.textController.text) ??
                            1);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Center(child: Text('Cancel Successfull!'))));
                  },
                  child: const Text("Confirm"),
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
