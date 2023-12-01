// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FlutterTabs extends StatefulWidget {
  final List<String> tabs;
  final Widget content;

  const FlutterTabs({
    super.key,
    required this.tabs,
    required this.content,
  });

  @override
  _FlutterTabsState createState() => _FlutterTabsState();
}

class _FlutterTabsState extends State<FlutterTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          initialIndex: 0,
          length: 5,
          child: TabBar(
            labelColor: const Color.fromARGB(255, 49, 155, 255),
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: const Color.fromARGB(255, 0, 0, 0),
            onTap: (index) {
              setState(() {
                selectedTabIndex = index;
              });
            },
            tabs: widget.tabs.map((tab) {
              return Tab(text: tab);
            }).toList(),
          ),
        )
      ],
    );
  }
}
