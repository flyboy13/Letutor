import 'package:flutter/material.dart';

class LessonScheduleApp extends StatelessWidget {
  const LessonScheduleApp({super.key});

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
          child: const Row(
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
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('calendar.png'),
                  // radius: 40,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Keegan DuRose', style: TextStyle(fontSize: 24)),
                    TextButton.icon(
                      onPressed: () {
                        // Direct message logic
                      },
                      icon: const Icon(Icons.message, color: Colors.white),
                      label: const Text('Direct Message',
                          style: TextStyle(color: Colors.white)),
                      // color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Currently, there are no requests for this user. Please wait for new requests or invite the teacher.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16),
            child: TextButton(
              onPressed: () {
                // Edit request logic
              },
              child:
                  const Text('Edit Request', style: TextStyle(color: Colors.white)),
              // color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
