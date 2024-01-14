import 'package:flutter/material.dart';

class TextIconComponent extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color? color;

  const TextIconComponent(
      {super.key, required this.title, required this.iconData, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 30,
          color: color ?? Colors.blue,
        ),
        Text(title,
            style: const TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 33, 148, 255)))
      ],
    );
  }
}
