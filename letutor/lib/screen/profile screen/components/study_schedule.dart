import 'package:flutter/material.dart';


class StudyScheduleEdit extends StatefulWidget {
  const StudyScheduleEdit({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<StudyScheduleEdit> createState() => _StudyScheduleEditState();
}

class _StudyScheduleEditState extends State<StudyScheduleEdit> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7, left: 1),
            child: const Text(
              "Study Schedule:",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 17, color: Colors.grey[900]),
            controller: widget.controller,
            // onChanged: ,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 15, right: 15),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26, width: 0.3),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26, width: 0.3),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26, width: 0.3),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: "note",
            ),
          )
        ],
      ),
    );
  }
}
