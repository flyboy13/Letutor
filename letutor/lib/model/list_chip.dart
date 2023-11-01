import 'package:flutter/material.dart';

Widget createListChip(double screenWidth, List<String> listChip) => Container(
      // padding: EdgeInsets.all(screenWidth * 0.03),
      child: Wrap(
        spacing: 5,
        children: List.generate(
          listChip.length,
          (index) => Chip(
            label: Text(
              listChip[index],
              style: TextStyle(
                  fontSize: screenWidth * 0.01, fontWeight: FontWeight.bold),
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
