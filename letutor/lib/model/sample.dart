import 'package:letutor/model/tutor.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class SampleTutor {
  List<Tutor> tutor = [
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
        true),
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
        true),
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
        false),
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
        false),
  ];
}
