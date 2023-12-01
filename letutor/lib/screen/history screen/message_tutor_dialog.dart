// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';

class MessageTutorDialog extends StatefulWidget {
  const MessageTutorDialog({super.key});

  @override
  _MessageTutorDialogState createState() => _MessageTutorDialogState();
}

class _MessageTutorDialogState extends State<MessageTutorDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(width: 1),
                ),
                hintText: 'Aa',
                suffixIcon: GestureDetector(
                  child: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
