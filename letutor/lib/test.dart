import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 5.0),
          const Text(
            'Select Mall',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...List.generate(
              5, (items) => ListTile(title: Text('column item: $items'))),
          // _buildMallPlaces(),

          const Divider(color: Colors.red),
          const Text('container starts'),
          Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text('listview item: $index'));
                  })),
          const Text('Container ends'),
          const Divider(color: Colors.red),
          //your button goes here..
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    print('button tapped');
                  },
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text('tap me',
                          style: TextStyle(color: Colors.white))))),
        ]),
      ),
    );
  }
}
