import 'package:flutter/material.dart';

Widget createScheduel(String name, double screenWidth) => Container(
    padding: EdgeInsets.all(screenWidth * 0.01),
    color: const Color.fromARGB(255, 241, 241, 241),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sat, 04 Nov 23',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('1 lesson'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              'avatar.png',
                              height: screenWidth * 0.07,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Tunisia'),
                          const Text('Keegan'),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Direct Message'),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('18:00 - 18:25'),
                        TextButton(
                          // color: Colors.red,
                          onPressed: () {},
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 41, 41)),
                          ),
                        )
                      ],
                    ),
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {},
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return const ListTile(
                              title: Text('Request for lesson'),
                            );
                          },
                          body: const ListTile(
                            title: Text(
                                'Currently there are no requests for this class. Please write down any requests for the teacher.'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(screenWidth * 0.02),
          color: Color.fromARGB(255, 255, 255, 255),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Go to meeting',
            ),
          ),
        ),
      ],
    ));
