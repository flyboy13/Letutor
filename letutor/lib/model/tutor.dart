import 'dart:ui';

import 'package:letutor/model/feedback.dart';
import 'package:letutor/model/schedule.dart';

class Tutor {
  String id;
  String image;
  String name;
  String country;
  int rate;
  String languages;
  String detail;
  bool love;

  List<Schedule> dateAvailable;
  List<FeedbackRate> feedbacks = [];

  List<String> specialties;
  VoidCallback? onLoveChanged;
  Tutor(
    this.id,
    this.image,
    this.name,
    this.country,
    this.rate,
    this.languages,
    this.detail,
    this.specialties,
    this.love,
    this.dateAvailable, [
    this.feedbacks = const [],
  ]);

  void toggleLove() {
    love = !love;
    onLoveChanged?.call();
    print(love);
  }

  void setReserved(String id, bool reserved) {
    for (var i = 0; i < dateAvailable.length; i++) {
      if (dateAvailable[i].id == id) {
        dateAvailable[i].isReserved = reserved;
      }
    }
  }

  void addFeedback(FeedbackRate feedback) {
    feedbacks.add(feedback);
  }

  int getTotalStar() {
    int total = 0;
    for (var i = 0; i < feedbacks.length; i++) {
      total += feedbacks[i].rating;
    }
    return (total / feedbacks.length).round();
  }
}
