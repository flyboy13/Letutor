import 'package:intl/intl.dart';
import 'package:letutor/model/topic.dart';
import 'package:letutor/model/date_time.dart';
import 'course.dart';

class User {
  String id;
  String email;
  String name;
  String avatar;
  String phone;
  String country;
  String languages;
  String level;
  String google;
  String studySchedule;
  List<String> roles;
  bool isOnline;
  //language
  //walletInfo
  DateTime birthday;
  List<Topic> learnTopics;
  List<Topic> testPreparations;
  List<Course> courses;

  User({
    this.id = '',
    this.email = '',
    this.name = '',
    this.phone = "",
    this.avatar = '',
    this.country = '',
    this.languages = '',
    this.level = "",
    this.google = '',
    this.studySchedule = '',
    this.roles = const [],
    this.learnTopics = const [],
    this.testPreparations = const [],
    this.courses = const [],
    this.isOnline = false,
    required this.birthday,
  });

  factory User.fromJson(json) {
    return User(
      id: json['id'] ?? "",
      email: json['email'] ?? "",
      name: json['name'] ?? "",
      avatar: json['avatar'] ?? "",
      phone: json['phone'] ?? "",
      country: json['country'] ?? "",
      level: json['level'] ?? "",
      languages: json['languages'] ?? "",
      google: json['google'] ?? "",
      studySchedule: json['studySchedule'] ?? "",
      isOnline: json['isOnline'] ?? false,
      roles: json['roles'] == null
          ? []
          : (json['roles'] as List).map((e) => e.toString()).toList(),
      learnTopics: json['learnTopics'] == null
          ? []
          : (json['learnTopics'] as List)
              .map((e) => Topic.fromJson(e))
              .toList(),
      testPreparations: json['testPreparations'] == null
          ? []
          : (json['testPreparations'] as List)
              .map((e) => Topic.fromJson(e))
              .toList(),
      birthday: json['birthday'] != null
          ? DateFormat(time1).parse(json['birthday'])
          : DateTime(1990),
      courses: json['courses'] == null
          ? []
          : (json['courses'] as List).map((e) => Course.fromJson(e)).toList(),
    );
  }

  List<Topic> getListWantToLearn() => [...learnTopics, ...testPreparations];
}
