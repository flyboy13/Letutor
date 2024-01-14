import 'package:letutor/model/tutor.dart';
import 'package:intl/intl.dart';

class FavouriteTutor {
  String id;
  String firstId;
  String secondId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Tutor? tutorInfo;

  FavouriteTutor(
      {this.id = '',
      this.firstId = '',
      this.secondId = '',
      this.createdAt,
      this.updatedAt,
      this.tutorInfo});

  factory FavouriteTutor.fromJson(json) {
    return FavouriteTutor(
      id: json['id'],
      firstId: json['firstId'],
      secondId: json['secondId'],
      createdAt: json['createdAt'] != null
          ? DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSSZ")
              .parse(json['createdAt'])
          : DateTime(2024),
      updatedAt: json['updatedAt'] != null
          ? DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSSZ")
              .parse(json['updatedAt'])
          : DateTime(2024),
      tutorInfo: Tutor.fromJson(json['secondInfo']['tutorInfo']),
    );
  }
}
