import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:letutor/control/tutor.dart';

class RatingStart extends StatefulWidget {
  final int rate;

  const RatingStart({super.key, required this.rate});

  @override
  RatingStartState createState() => RatingStartState();
}

class RatingStartState extends State<RatingStart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.rate,
        (index) => const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
