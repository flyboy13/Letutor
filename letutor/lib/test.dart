import 'package:flutter/material.dart';

class LessonScheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            // Go to meeting logic
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back, color: Colors.blue),
              Text('Go to meeting', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Cancel logic
            },
            child: Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('calendar.png'),
                  // radius: 40,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Keegan DuRose', style: TextStyle(fontSize: 24)),
                    TextButton.icon(
                      onPressed: () {
                        // Direct message logic
                      },
                      icon: Icon(Icons.message, color: Colors.white),
                      label: Text('Direct Message',
                          style: TextStyle(color: Colors.white)),
                      // color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Currently, there are no requests for this user. Please wait for new requests or invite the teacher.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(16),
            child: TextButton(
              onPressed: () {
                // Edit request logic
              },
              child:
                  Text('Edit Request', style: TextStyle(color: Colors.white)),
              // color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
