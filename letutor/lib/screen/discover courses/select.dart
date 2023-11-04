import 'package:flutter/material.dart';

class FlutterSelect extends StatefulWidget {
  final List<String> options;
  final String placeholder;
  final List<String> selectedValues;
  final Function(List<String>) onChanged;

  const FlutterSelect({
    Key? key,
    required this.options,
    required this.placeholder,
    required this.selectedValues,
    required this.onChanged,
  }) : super(key: key);

  @override
  _FlutterSelectState createState() => _FlutterSelectState();
}

class _FlutterSelectState extends State<FlutterSelect> {
  List<String> selectedValues = [];

  @override
  void initState() {
    super.initState();
    selectedValues = widget.selectedValues;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: widget.placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      isExpanded: true,
      items: widget.options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      value: selectedValues.isEmpty ? null : selectedValues.first,
      onChanged: (value) {
        setState(() {
          selectedValues = [value!];
        });
        widget.onChanged(selectedValues);
      },
    );
  }
}
