import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Table'),
        ),
        body: DataTable(
          columns: [
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Page',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Description',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(Text('sample.pdf')),
                DataCell(Text('0')),
                DataCell(Text('Not provided')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
