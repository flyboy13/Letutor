import 'package:flutter/material.dart';

Widget appbar() => Row(children: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: TextButton(
          onPressed: () {},
          // style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'TUTOR',
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 29, 146, 255)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: TextButton(
          onPressed: () {},
          // style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'SCHEDUEL',
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 29, 146, 255)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: TextButton(
          onPressed: () {},
          // style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'HISTORY',
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 29, 146, 255)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: TextButton(
          onPressed: () {},
          // style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'COURSES',
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 29, 146, 255)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: TextButton(
          onPressed: () {},
          // style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'MY COURSES',
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 29, 146, 255)),
          ),
        ),
      ),
    ]);
