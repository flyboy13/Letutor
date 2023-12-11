// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:letutor/model/list_chip.dart';
import 'package:letutor/model/rating_start.dart';
import 'package:letutor/model/love_button.dart';
import 'package:letutor/model/sample.dart';
// import 'package:flushbar/flushbar.dart';
import 'package:letutor/model/tutor.dart';
import 'package:go_router/go_router.dart';

class InforCard extends StatefulWidget {
  const InforCard({super.key, required this.tutor, required this.sampleTutor});
  final Tutor tutor;
  final SampleTutor sampleTutor;
  @override
  InforCardState createState() => InforCardState();
}

class InforCardState extends State<InforCard> {
  // bool isLoved = false;

  void onLoveButtonPressed() {
    setState(() {
      //
      widget.sampleTutor.toggleLove(widget.tutor.id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Update favourite tutor success'),
          duration: Duration(seconds: 2),
        ),
      );

      //      Flushbar(
      //   message: "Update favourite tutor success",
      //   duration: Duration(seconds: 3),
      // )..show(context);

      // widget.sampleTutor.tutor.map((tutor) => print(tutor.love));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<String> listChip = [
      'IELTS',
      'TOEFL',
      'TOEIC',
    ];
    Widget listSpecialities = createListChip(listChip);

    return Card(
      // color: const Color.fromARGB(255, 255, 255, 255),
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.all(width * 0.01),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(widget.tutor.image)),
                SizedBox(
                  width: width * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () =>
                            context.go('/tutor/${widget.tutor.id}'),
                        child: Text(
                          widget.tutor.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Text(
                      widget.tutor.country,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    RatingStart(rate: widget.tutor.rate),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                LoveButton(
                  isLoved: widget.tutor.love,
                  onPressed: onLoveButtonPressed,
                ),
              ],
            ),
            Wrap(children: [listSpecialities]),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              widget.tutor.detail,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  // style: style,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.event_available),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Book'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
