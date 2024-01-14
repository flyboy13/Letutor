// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class CircleBox extends StatelessWidget {
  double size;
  Widget child;
  CircleBox({
    super.key,
    required this.size,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ClipRRect(borderRadius: BorderRadius.circular(1000), child: child),
    );
  }
}
