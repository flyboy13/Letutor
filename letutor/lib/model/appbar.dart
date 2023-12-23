import 'package:flutter/material.dart';

Widget appbar(BuildContext context) => Row(children: [
      // SizedBox(width: MediaQuery.of(context).size.width * 0.01),
      Image.asset(
        "assets/Let_logo.png",
        height: MediaQuery.of(context).size.height * 0.02,

        // width: MediaQuery.of(context).size.width * 0.1,
        alignment: Alignment.centerLeft,

        // Adjust the logo width as needed
      ),
    ]);
