// ignore_for_file: avoid_print

import 'package:letutor/model/feedback.dart';
import 'package:letutor/model/schedule.dart';
import 'package:letutor/model/tutor.dart';
import 'package:letutor/model/user.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

List<Schedule> sampleSchedule() {
  return [
    Schedule(
        id: uuid.v4(),
        start: DateTime(2023, 11, 25, 7, 0),
        end: DateTime(2023, 11, 26, 7, 30)),
    Schedule(
        id: uuid.v4(),
        start: DateTime(2023, 11, 27, 8),
        end: DateTime(2023, 11, 28, 8, 30)),
    // Schedule(
    //     id: uuid.v4(),
    //     start: DateTime(2022, 12, 11, 9),
    //     end: DateTime(2022, 12, 12, 9, 30)),
  ];
}

List<FeedbackRate> sampleFeedback() {
  return [
    FeedbackRate(
      id: uuid.v4(),
      userId: UsersSample.users[1].id,
      content: "Greate!",
      createdAt: DateTime(2023, 11, 29),
      rating: 5,
    ),
    FeedbackRate(
      id: uuid.v4(),
      userId: UsersSample.users[2].id,
      content: "Thank you!",
      createdAt: DateTime(2023, 11, 28),
      rating: 5,
    ),
    FeedbackRate(
      id: uuid.v4(),
      userId: UsersSample.users[3].id,
      content: "Very good!",
      createdAt: DateTime(2023, 11, 29),
      rating: 5,
    ),
  ];
}

class UsersSample {
  static List<User> users = [
    User(
      id: uuid.v4(),
      email: "test@gmail.com",
      fullName: "Tran Huu An",
      phone: "0584802232",
      image: "avatar.png",
      birthDay: DateTime(2002, 10, 13),
      country: "Vietnam",
      level: "Beginner",
      topicToLearn: "TOEIC",
      bookingHistory: [],
      sessionHistory: [],
    ),
    User(
      id: uuid.v4(),
      email: "test@gmail.com",
      fullName: "Ngo Viet",
      phone: "0584802232",
      image: "avatar.png",
      birthDay: DateTime(2002, 10, 13),
      country: "Vietnam",
      level: "Beginner",
      topicToLearn: "TOEIC",
      bookingHistory: [],
      sessionHistory: [],
    ),
    User(
      id: uuid.v4(),
      email: "test@gmail.com",
      fullName: "Luu Van Hao",
      phone: "0584802232",
      image: "avatar.png",
      birthDay: DateTime(2002, 10, 13),
      country: "Vietnam",
      level: "Beginner",
      topicToLearn: "TOEIC",
      bookingHistory: [],
      sessionHistory: [],
    ),
    User(
      id: uuid.v4(),
      email: "test@gmail.com",
      fullName: "Nguoi An Danh",
      phone: "0584802232",
      image: "avatar.png",
      birthDay: DateTime(2002, 10, 13),
      country: "Vietnam",
      level: "Beginner",
      topicToLearn: "TOEIC",
      bookingHistory: [],
      sessionHistory: [],
    ),
  ];
}

class SampleTutor {
  static List<Tutor> tutor = [
    Tutor(
      uuid.v4(),
      'avatar.png',
      'Nguyen Duc Tai',
      'Viet Nam',
      5,
      'Vietnamese',
      'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, ',
      <String>[
        "IELTS",
        "English for Business",
        "STARTERS",
        "MOVERS",
        "FLYERS",
        'TOEIC',
      ],
      true,
      sampleSchedule(),
      sampleFeedback(),
    ),
    Tutor(
      uuid.v4(),
      'avatar.png',
      'Nguyen Duc Tai',
      'Viet Nam',
      5,
      'Vietnamese',
      'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, ',
      <String>[
        "IELTS",
        "English for Business",
        "STARTERS",
        "MOVERS",
        "FLYERS",
        'TOEIC',
      ],
      true,
      sampleSchedule(),
      sampleFeedback(),
    ),
    Tutor(
      uuid.v4(),
      'avatar.png',
      'Le Van A',
      'Viet Nam',
      5,
      'Vietnamese',
      'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, ',
      <String>[
        "IELTS",
        "English for Business",
        "STARTERS",
        "MOVERS",
        "FLYERS",
        'TOEIC',
      ],
      false,
      sampleSchedule(),
      sampleFeedback(),
    ),
    Tutor(
      uuid.v4(),
      'avatar.png',
      'Justin',
      'Canada',
      5,
      'English',
      'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, ',
      <String>[
        "IELTS",
        "English for Business",
        "STARTERS",
        "MOVERS",
        "FLYERS",
        'TOEIC',
      ],
      false,
      sampleSchedule(),
      sampleFeedback(),
    ),
  ];
  void toggleLove(String id) {
    for (var t in tutor) {
      if (t.id == id) {
        print(t.id);
        // t.toggleLove();
        t.love = !t.love;
        break;
      }
    }
  }
}
