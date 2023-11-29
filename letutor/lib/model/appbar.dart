import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget appbar(BuildContext context) => LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Display a horizontal layout
          return FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(children: [_buildButtons(context)]),
          );
        } else {
          // Display a vertical layout
          return FittedBox(
            fit: BoxFit.fitWidth,
            child: Column(children: [_buildButtons(context)]),
          );
        }
      },
    );

Widget _buildButtons(BuildContext context) {
  return FittedBox(
      fit: BoxFit.fitWidth,
      child: Wrap(children: [
        Flexible(
            child: FittedBox(
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
                ))),
        Flexible(
            child: FittedBox(
                child: TextButton(
          onPressed: () => context.go('/scheduel'),
          // style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'SCHEDUEL',
            style: TextStyle(
                color: Color.fromARGB(255, 29, 146, 255),
                fontWeight: FontWeight.bold),
          ),
        ))),
        Flexible(
            child: FittedBox(
                child: TextButton(
          onPressed: () => context.go('/history'),
          // style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'HISTORY',
            style: TextStyle(
                color: Color.fromARGB(255, 29, 146, 255),
                fontWeight: FontWeight.bold),
          ),
        ))),
        Flexible(
            child: FittedBox(
                child: TextButton(
          onPressed: () => context.go('/courses'),
          // style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'COURSES',
            style: TextStyle(
                color: Color.fromARGB(255, 29, 146, 255),
                fontWeight: FontWeight.bold),
          ),
        ))),
        Flexible(
            child: FittedBox(
                child: TextButton(
          onPressed: () => context.go('/my_courses'),
          // style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'MY COURSES',
            style: TextStyle(
                color: Color.fromARGB(255, 29, 146, 255),
                fontWeight: FontWeight.bold),
          ),
        ))),
      ]));
}
