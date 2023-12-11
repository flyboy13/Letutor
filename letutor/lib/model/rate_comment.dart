import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:letutor/control/feedback.dart';
import 'package:letutor/model/sample.dart';

class RateAndComment extends StatelessWidget {
  const RateAndComment({super.key, required this.feedback});

  final FeedbackRate feedback;

  @override
  Widget build(BuildContext context) {
    final user =
        UsersSample.users.where((user) => user.id == feedback.userId).first;

    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: ClipOval(
                      // Wrap the Image.asset with ClipOval
                      child: Image.asset(user.image),
                    )),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.fullName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      // RateStars(count: feedback.rating)
                    ],
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10, left: 100),
                child: feedback.content.isNotEmpty
                    ? Text(feedback.content)
                    : null),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat.yMEd().add_jm().format(feedback.createdAt),
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
