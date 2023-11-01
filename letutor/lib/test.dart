import 'package:flutter/material.dart';

class InforCard extends StatelessWidget {
  final String name;
  final String location;
  final List<String> interests;
  final List<String> qualifications;

  const InforCard({
    Key? key,
    required this.name,
    required this.location,
    required this.interests,
    required this.qualifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name and location
          Row(
            children: [
              Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Spacer(),
              Text(location),
            ],
          ),

          // Interests
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Interests:', style: TextStyle(fontSize: 16)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: interests.map((interest) => Text(interest)).toList(),
          ),

          // Qualifications
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Qualifications:', style: TextStyle(fontSize: 16)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: qualifications.map((qualification) => Text(qualification)).toList(),
          ),
        ],
      ),
    );
  }
}