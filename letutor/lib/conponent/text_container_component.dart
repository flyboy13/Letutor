import 'package:flutter/cupertino.dart';

class TextContainerComponent extends StatelessWidget {
  final String title;
  final double? radius;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;

  const TextContainerComponent({
    super.key,
    required this.title,
    this.radius,
    this.color,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      decoration: BoxDecoration(
          color: color ?? const Color(0xFFF5F6FA),
          border: Border.all(
              color: borderColor ?? color ?? const Color(0xFFF5F6FA)),
          borderRadius: BorderRadius.circular(radius ?? 10.0)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}