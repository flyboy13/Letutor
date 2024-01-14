import 'package:flutter/cupertino.dart';

class ListSelectionComponent extends StatelessWidget {
  final String title;
  final Widget child;

  const ListSelectionComponent({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: child,
        )
      ],
    );
  }
}
