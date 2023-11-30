// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:letutor/control/account.dart';
import 'package:letutor/model/accountActive.dart';

import 'package:letutor/model/sample.dart';
// import 'package:flushbar/flushbar.dart';
import 'package:letutor/model/tutor.dart';

class UserNavigate extends StatefulWidget {
  const UserNavigate({super.key});

  @override
  UserNavigateState createState() => UserNavigateState();
}

class UserNavigateState extends State<UserNavigate> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse("2002-10-13");
    Account accountActive = Account(
        "",
        'Nguyen Duc Tai',
        'Myanimalclass@gmail.com',
        '0584802232',
        'Viet Nam',
        dateTime,
        ["IELTS"],
        "note");

    return Card(
      // color: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.01,
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          // height: MediaQuery.of(context).size.width * 0.05,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            children: [
              Text(
                accountActive.getterName(),
                style: TextStyle(
                  color: Color.fromARGB(255, 18, 117, 247),
                ),
              ),
              // Image.asset(accountActive.getterImageUrl())
            ],
          )),
    );
  }
}
