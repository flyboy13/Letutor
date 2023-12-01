import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letutor/model/userProfileButton.dart';

Widget appbar(BuildContext context) => Row(children: [
      // SizedBox(width: MediaQuery.of(context).size.width * 0.01),
      FittedBox(
          fit: BoxFit.contain,
          child: Image.asset(
            "Let_logo.png",
            height: MediaQuery.of(context).size.height * 0.05,

            // width: MediaQuery.of(context).size.width * 0.1,
            alignment: Alignment.centerLeft,

            // Adjust the logo width as needed
          )),
      FittedBox(
          fit: BoxFit.fitWidth,
          child: TextButton(
            onPressed: () => context.go('/tutor'),
            // style: TextButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text(
              'TUTOR',
              style: TextStyle(
                  color: Color.fromARGB(255, 29, 146, 255),
                  fontWeight: FontWeight.bold),
            ),
          )),
      FittedBox(
          child: TextButton(
              onPressed: () => context.go('/scheduel'),
              // style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text(
                'SCHEDUEL',
                style: TextStyle(
                    color: Color.fromARGB(255, 29, 146, 255),
                    fontWeight: FontWeight.bold),
              ))),

      FittedBox(
          child: TextButton(
        onPressed: () => context.go('/history'),
        // style: TextButton.styleFrom(backgroundColor: Colors.blue),
        child: const Text(
          'HISTORY',
          style: TextStyle(
              color: Color.fromARGB(255, 29, 146, 255),
              fontWeight: FontWeight.bold),
        ),
      )),
      FittedBox(
          child: TextButton(
        onPressed: () => context.go('/courses'),
        // style: TextButton.styleFrom(backgroundColor: Colors.blue),
        child: const Text(
          'COURSES',
          style: TextStyle(
              color: Color.fromARGB(255, 29, 146, 255),
              fontWeight: FontWeight.bold),
        ),
      )),
      FittedBox(
          child: TextButton(
        onPressed: () => context.go('/my_courses'),
        // style: TextButton.styleFrom(backgroundColor: Colors.blue),
        child: const Text(
          'MY COURSES',
          style: TextStyle(
              color: Color.fromARGB(255, 29, 146, 255),
              fontWeight: FontWeight.bold),
        ),
      )),
      // Expanded(child: SizedBox()),
      FittedBox(
          child: ElevatedButton(
              onPressed: () => context.go('/profile'),
              // style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: UserNavigate())),
      // // Flexible(
      // //     child: FittedBox(
      // //         child: TextButton(
      // //             onPressed: () => context.go('/my_courses'),
      // //             // style: TextButton.styleFrom(backgroundColor: Colors.blue),
      // //             child: UserNavigate()))),
      // // const UserNavigate(),
    ]);
