// import 'package:flutter/material.dart

class Event<T> {
  final String id;
  final DateTime start;
  final DateTime end;
  final DateTime date;
  final T payload;

  Event({
    required this.id,
    required this.start,
    required this.end,
    required this.date,
    required this.payload,
  });
}