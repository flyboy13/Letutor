// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:letutor/model/list_chip.dart';
import 'package:letutor/model/rating_start.dart';
import 'package:letutor/model/love_button.dart';

import 'package:letutor/model/tutor.dart';

class InforCard extends StatefulWidget {
  const InforCard({super.key, required this.tutor});
  final Tutor tutor;
  @override
  InforCardState createState() => InforCardState();
}

class InforCardState extends State<InforCard> {
  bool isLoved = false;

  void onLoveButtonPressed() {
    setState(() {
      isLoved = !isLoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> listChip = [
      'IELTS',
      'TOEFL',
      'TOEIC',
    ];
    Widget listSpecialities = createListChip(screenHeight, listChip);

    double space1 = screenWidth * 0.25;

    return Card(
      // margin: const EdgeInsets.only(bottom: 20),
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        width: space1,
        // constraints: BoxConstraints(
        //   maxWidth: screenWidth * 0.2,
        // ),
        padding: EdgeInsets.all(screenWidth * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(widget.tutor.image)),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.tutor.name,
                      style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.tutor.country,
                      style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                    RatingStart(rate: widget.tutor.rate),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.104,
                ),
                LoveButton(
                  isLoved: widget.tutor.love,
                  onPressed: onLoveButtonPressed,
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Wrap(children: [listSpecialities]),
          ],
        ),
      ),
    );
  }
}
