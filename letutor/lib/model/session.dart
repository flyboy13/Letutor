
import 'package:letutor/model/tutor.dart';

class Session {
  String id;
  Tutor tutor;
  DateTime start;
  int duration;

  Session({
    required this.id,
    required this.tutor,
    required this.start,
    required this.duration,
  });
}