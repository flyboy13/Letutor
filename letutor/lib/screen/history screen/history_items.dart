import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:timeago/timeago.dart' as timeago;

class HistoryListTile extends StatefulWidget {
  const HistoryListTile({Key? key}) : super(key: key);

  @override
  HistoryListTileState createState() => HistoryListTileState();
}

class HistoryListTileState extends State<HistoryListTile> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 223, 223),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat(
              'EE, dd MMM y',
            ).format(
              DateTime.now(),
            ),
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Text(
              timeago.format(DateTime.now()),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 70,
                        height: 70,
                        child: const CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                            "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg",
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            "Keegan",
                            style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            "Viet Nam",
                            style: TextStyle(
                                fontSize: screenWidth * 0.02,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              child: TextButton(
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.chat_outlined,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Direct Message ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () => {},
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView(
            padding: const EdgeInsets.only(top: 0),
            shrinkWrap: true,
            primary: false,
            children: [
              // LessonHistoryListTile(),
            ],
          ),
        ],
      ),
    );
  }
}
