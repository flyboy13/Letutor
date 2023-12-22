import 'package:flutter/material.dart';

class NameEdit extends StatefulWidget {
  const NameEdit({super.key, required this.changeName, required this.name});
  final Function(String) changeName;
  final String name;

  @override
  State<NameEdit> createState() => _NameEditState();
}

class _NameEditState extends State<NameEdit> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7, left: 5),
            child: const Text(
              "Name:",
              style: TextStyle(fontSize: 17),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 17, color: Colors.grey[900]),
            controller: _controller,
            onChanged: (value) => widget.changeName(value),
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
              hintText: "Your name",
            ),
          )
        ],
      ),
    );
  }
}
