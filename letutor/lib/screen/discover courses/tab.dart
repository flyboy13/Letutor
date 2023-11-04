import 'package:flutter/material.dart';

class FlutterTabs extends StatefulWidget {
  final List<String> tabs;
  final Widget content;

  const FlutterTabs({
    Key? key,
    required this.tabs,
    required this.content,
  }) : super(key: key);

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
            labelColor: Color.fromARGB(255, 49, 155, 255),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
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
