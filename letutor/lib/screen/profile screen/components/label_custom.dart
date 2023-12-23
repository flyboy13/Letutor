import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LabelCustom extends StatelessWidget {
  final String content;
  const LabelCustom({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5.0)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(
          content,
        
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.close,
          size: 15,
        )
      ]),
    );
  }
}