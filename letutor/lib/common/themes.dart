import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: const Color.fromARGB(255, 0, 102, 14),
        onPrimary: Colors.black,
        secondary: Colors.deepOrange,
        onSecondary: const Color.fromARGB(255, 190, 34, 34),
      ),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: const Color.fromARGB(255, 0, 0, 0),
        onPrimary: const Color.fromARGB(255, 0, 0, 0),
        secondary: const Color.fromARGB(255, 0, 0, 0),
        onSecondary: const Color.fromARGB(255, 0, 0, 0),
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: const Color.fromARGB(255, 0, 0, 0), // color for body text
        displayColor: const Color.fromARGB(255, 0, 0, 0), // color for headings
      ),
);
