import 'package:flutter/material.dart';
import 'package:letutor/model/tutor.dart';

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
