// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:timeago/timeago.dart' as timeago;

Widget createHistory(String name, double screenWidth) => Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 238, 238),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Column(children: [
                    Text(
                      DateFormat(
                        'EE, dd MMM y',
                      ).format(
                        DateTime.now(),
                      ),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 15,
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
                    // ListView(
                    //   padding: const EdgeInsets.only(top: 0),
                    //   shrinkWrap: true,
                    //   primary: false,
                    //   children: [
                    //     // LessonHistoryListTile(),
                    //   ],
                    // ),
                  ])),
              Expanded(
                flex: 6,
                child: Container(
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
                        flex: 4,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 70,
                              height: 70,
                              child: const CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage("avatar1.png"),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ), //Avartar
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
                                  name,
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                  "Viet Nam",
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.027,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: TextButton(
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.chat_outlined,
                                            size: 20,
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            "Direct Message ",
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.027,
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
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Text(
                    "Lesson Time: 13:30 - 13:55",
                    style: TextStyle(fontSize: screenWidth * 0.03),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: screenWidth * 0.005,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Text(
                    "No request for lesson",
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Text(
                    "Tutor haven't reviewed yet",
                    style: TextStyle(fontSize: screenWidth * 0.03),
                  ),
                ),
              )
            ],
          ),
          Container(
              padding: EdgeInsets.all(screenWidth * 0.01),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Text(
                      "Rating",
                      style: TextStyle(fontSize: screenWidth * 0.03),
                    ),
                  )),
                  Row(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              textStyle:
                                  TextStyle(fontSize: screenWidth * 0.04)),
                          child: const Text("Edit"),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.03,
                      ),
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              textStyle:
                                  TextStyle(fontSize: screenWidth * 0.04)),
                          child: const Text("Report"),
                        ),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
