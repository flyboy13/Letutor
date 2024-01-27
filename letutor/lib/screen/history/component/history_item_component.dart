import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:letutor/conponent/circle_box.dart';
import 'package:letutor/conponent/image_network_component.dart';
import 'package:letutor/model/font_text.dart';
import 'package:letutor/model/schedule.dart';
import 'package:letutor/model/title_string.dart';

import '../../meeting/video_meeting.dart';

class HistoryItemComponent extends StatelessWidget {
  final Schedule schedule;

  const HistoryItemComponent({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    final Schedule scheduleDetail = schedule.scheduleDetailInfo!.scheduleInfo!;
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
      },
      children: <TableRow>[
        TableRow(children: <Widget>[
          Container(
            height: 180,
            child: Container(
              child: Column(
                children: [
                  Text(DateFormat('dd/MM/yyyy').format(
                      DateTime.fromMillisecondsSinceEpoch(schedule
                          .scheduleDetailInfo!.scheduleInfo!.startTimestamp))),
                ],
              ),
            ),
          ),
          Container(
            height: 180,
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
                        TitleString.noName,
                    style: text14.copyWith(color: Colors.black)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 180,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      schedule.scheduleDetailInfo?.scheduleInfo?.startTime ??
                          "",
                      style: text14.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      " - ",
                      style: text14.copyWith(color: Colors.black),
                    ),
                    Text(
                      schedule.scheduleDetailInfo?.scheduleInfo?.endTime ?? "",
                      style: text14.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: Get.width - 40,
                  child: Text(
                    TitleString.noRequirementForLesson,
                    style: text14.copyWith(color: Colors.black),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    children: [
                      if (schedule.feedbacks.isEmpty)
                        Text(TitleString.noFeedBack),
                      ...schedule.feedbacks.map(
                        (e) => Column(
                          children: [
                            Text(TitleString.reviews),
                            RatingBar.builder(
                              initialRating: e?.rating.toDouble() ?? 0,
                              minRating: 0,
                              maxRating: 5,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 5,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (schedule.showRecordUrl)
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoMeeting(
                                studentMeetingLink:
                                    schedule.studentMeetingLink)),
                      )
                    },
                    child: Text(TitleString.enterSchedule),
                  ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
