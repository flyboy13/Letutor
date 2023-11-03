// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Privacy Policy',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Terms & Conditions',
                  style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Contact', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Guide', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {},
              child:
                  Text('Become a tutor', style: TextStyle(color: Colors.black)),
            ),
            Text('Copyright © 2021 Tutoring. All rights reserved.'),
          ]),
          SizedBox(height: screenHeight * 0.02),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('LETTUTOR VIET NAM COMPANY LIMITED (TC: 0317003289)'),
          ]),
          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Headquarters: 9 Street No. 3, KDC Cityland Park Hills, Ward 10, Go Vap District, Ho Chi Minh City.")
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Phone: +84 945 337 337.Email: hello@lettutor.com")
            ],
          )
        ],
      ),
    );
  }
}
