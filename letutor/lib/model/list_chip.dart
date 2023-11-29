import 'package:flutter/material.dart';

Widget createListChip(List<String> listChip) => FittedBox(
      fit: BoxFit.scaleDown,
      // padding: EdgeInsets.all(screenWidth * 0.03),
      child: Wrap(
        spacing: 5,
        children: List.generate(
          listChip.length,
          (index) => Chip(
            label: Text(
              listChip[index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            labelStyle: const TextStyle(color: Colors.blue),
            backgroundColor: Colors.blue[50],
            shape: StadiumBorder(
              side: BorderSide(color: Colors.blue.shade100),
            ),
          ),
        ),
      ),
    );
