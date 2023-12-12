import 'package:letutor/control/topic.dart';

  

class Course {
  int coursePrice;
  int defaultPrice;
  String id;
  String name;
  String description;
  String imageUrl;
  String reason;
  String purpose;
  String other_details;
  String level;
  bool visible;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Topic> topics;


  Course({
    this.coursePrice = 0,
    this.defaultPrice = 0,
    this.id = '',
    this.name = '',
    this.description = '',
    this.imageUrl = '',
    this.reason = '',
    this.purpose = '',
    this.other_details = '',
    this.level = '',
    this.visible = false,
    this.createdAt,
    this.updatedAt,
    this.topics = const [],

  });

  
}
