import 'package:flutter/material.dart';

class ThreeColumnLayout extends StatelessWidget {
  final List<Widget> cards;

  const ThreeColumnLayout({
    Key? key,
    required this.cards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 1,
          runSpacing: 1,
          children: cards,
        ),
      ],
    );
  }
}
