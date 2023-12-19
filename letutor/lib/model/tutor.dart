import 'package:intl/intl.dart';
import 'package:letutor/model/user.dart';
import 'package:letutor/model/date_time.dart';

import 'review.dart';

class Tutor {
  User? user;
  User? userModel;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  bool isFavorite;

  double rating;
  int price;
  String userId;
  String id;
  String education;
  String experience;
  String accent;
  String interests;
  String specialties;
  String languages;

  List<String> studentGroupId;
  List<Review> feedbacks;

  Tutor({
    this.rating = 0,
    this.price = 0,
    this.userId = '',
    this.id = '',
    this.education = '',
    this.experience = '',
    this.accent = '',
    this.interests = '',
    this.specialties = '',
    this.languages = '',
    this.isFavorite = false,
    this.user,
    this.userModel,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId = const [],
    this.feedbacks = const [],
  });

  factory Tutor.fromJson(json) {
    return Tutor(
      rating: json['rating'] ?? 0,
      userId: json['userId'] ?? '',
      id: json['id'] ?? '',
      education: json['education'] ?? '',
      experience: json['experience'] ?? '',
      accent: json['accent'] ?? '',
      interests: json['interests'] ?? '',
      specialties: json['specialties'] ?? '',
      languages: json['languages'] ?? '',
      price: json['price'] ?? 0,
      isFavorite: json['isFavorite'] ?? false,
      user: User.fromJson(json),
      userModel: (json['User'] == null) ? null : User.fromJson(json['User']),
      createdAt: json['createdAt'] != null
          ? DateFormat(time1).parse(json['createdAt'])
          : DateTime(2023),
      updatedAt: json['updatedAt'] != null
          ? DateFormat(time1).parse(json['updatedAt'])
          : DateTime(2023),
      deletedAt: json['deletedAt'] != null
          ? DateFormat(time1).parse(json['deletedAt'])
          : DateTime(2023),
      studentGroupId: json['studentGroupId'] == null
          ? []
          : (json['studentGroupId'] as List).map((e) => e.toString()).toList(),
      feedbacks: json['feedbacks'] == null
          ? []
          : (json['feedbacks'] as List).map((e) => Review.fromJson(e)).toList(),
    );
  }
}
