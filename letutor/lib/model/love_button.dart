import 'package:flutter/material.dart';

class LoveButton extends StatefulWidget {
  final bool isLoved;
  final void Function() onPressed;

  const LoveButton({
    Key? key,
    required this.isLoved,
    required this.onPressed,
  }) : super(key: key);

  @override
  _LoveButtonState createState() => _LoveButtonState();
}

class _LoveButtonState extends State<LoveButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: Icon(
        widget.isLoved ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
