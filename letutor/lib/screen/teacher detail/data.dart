import 'package:letutor/control/course.dart';
import 'package:letutor/control/review.dart';
import 'package:letutor/control/teacher.dart';

const teachers = [
  Teacher(
      'Keegan',
      'assets/keegan-avatar.png',
      'France',
      5,
      60,
      'I am passionate about running and fitness, '
          'I often compete in trail/mountain running events and I love pushing myself. '
          'I am training to one day take part in ultra-endurance events. '
          'I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. '
          'My most memorable life experience would be living in and traveling around Southeast Asia.',
      [
        'English for kids',
        'English for Business',
        'Conversational',
        'IELTS',
        'TOEFL',
        'TOEIC'
      ]),
  Teacher(
      'Jill Leano',
      'assets/jill-leano-avatar.png',
      'France',
      4,
      9,
      "Hi, My name is Jill I am an experienced English Teacher from Philippine. "
          "I would like to share my enthusiasm with the learners in this platform. "
          "I've been working with diverse learners of all levels for many years. "
          "I am greatly passionate about about profession. I love teaching "
          "because I can help others improve their skills and it gives me joy and "
          "excitement meeting different learners around the world. "
          "In my class I worked with wonderful enthusiasm and positivity, "
          "and I'm happy to focus on my learner's goal.",
      [
        'English for kids',
        'English for Business',
        'Conversational',
        'IELTS',
        'TOEFL',
        'TOEIC'
      ]),
  Teacher(
      'April Baldo',
      'assets/april-baldo-avatar.png',
      'Philippine',
      4,
      22,
      "Hello! My name is April Baldo, you can just call me Teacher April. "
          "I am an English teacher and currently teaching in senior high school. "
          "I have been teaching grammar and literature for almost 10 years. "
          "I am fond of reading and teaching literature as one way of knowing one’s "
          "beliefs and culture. I am friendly and full of positivity. "
          "I love teaching because I know each student has something to bring on. "
          "Molding them to become an individual is a great success.",
      [
        'English for Business',
        'KET',
        'PET',
        'IELTS',
      ]),
  Teacher(
      'Joan Gacer',
      'assets/joan-gacer-avatar.png',
      'Taiwan',
      3,
      6,
      "I was a customer service sales executive for 3 years before I become an ESL teacher "
          "I am trained to deliver excellent service to my clients so I can help you with "
          "business English dealing with customers or in sales-related jobs and a lot more, "
          "I also love to teach beginner, intermediate and advance I speak slowly and "
          "clearly so that the student can easily follow my instructions and pronunciation. "
          "In my class, I want environment-friendly fun and engaging I have many activities "
          "designed to help your enthusiasm in learning the language. I'm so excited to "
          "meet you in one of my classes let us have fun while learning English. See you there.",
      [
        'English for kids',
        'English for Business',
        'Conversational',
        'STARTERS',
        'MOVERS',
        'FLYERS',
        'KET',
        'PET',
        'IELTS',
        'TOEFL',
        'TOEIC'
      ]),
];

const courses = [
  Course(
    'Basic Conversation Topics',
    'course1.png',
    "Let's discuss how technology is changing the way we live",
    'Intermediate',
    9,
  ),
  Course(
    'Life in the Internet Age',
    'course1.png',
    "Let's discuss our relationship as humans with our planet, Earth",
    'Intermediate',
    7,
  ),
  Course(
    'IELTS Speaking Part 3',
    'course1.png',
    "Let's discuss the many aspects of living a long, happy life",
    'Intermediate',
    6,
  ),
  Course(
    'Movies and Television',
    'course1.png',
    "Let's discuss our preferences and habits surrounding movies and television shows",
    'Beginner',
    10,
  ),
  Course(
    'Raising Children',
    'course1.png',
    "Let's discuss raising children and practice using English for common parenting situations",
    'Intermediate',
    11,
  ),
  Course(
    'The Olympics',
    'course1.png',
    "Let’s practice talking about the Olympics, the biggest sports festival on earth!",
    'Advanced',
    8,
  ),
];

const courseHours = [
  '00:00 - 00:25',
  '00:30 - 00:55',
  '01:00 - 01:25',
  '01:30 - 01:55',
  '02:00 - 02:25',
  '02:30 - 02:55',
  '03:00 - 03:25',
  '03:30 - 03:55',
  '04:00 - 04:25',
  '04:30 - 04:55',
  '05:00 - 05:25',
  '05:30 - 05:55',
  '06:00 - 06:25',
  '06:30 - 06:55',
  '07:00 - 07:25',
  '07:30 - 07:55',
  '08:00 - 08:25',
  '08:30 - 08:55',
  '09:00 - 09:25',
  '09:30 - 09:55',
  '10:00 - 10:25',
  '10:30 - 10:55',
  '11:00 - 11:25',
  '11:30 - 11:55',
  '12:00 - 12:25',
  '12:30 - 12:55',
  '13:00 - 13:25',
  '13:30 - 13:55',
  '14:00 - 14:25',
  '14:30 - 14:55',
  '15:00 - 15:25',
  '15:30 - 15:55',
  '16:00 - 16:25',
  '16:30 - 16:55',
  '17:00 - 17:25',
  '17:30 - 17:55',
  '18:00 - 18:25',
  '18:30 - 18:55'
];

const reviews = [
  Review('thanhnga266', 'This tutor is great', 5),
  Review('bichthuy', 'He is very kind', 4),
  Review('ngocnhu', 'This tutor always come late', 2),
  Review('sontungnguyen151', 'He does not know how to teach apparently', 1),
  Review('vunguyen', 'I am out of idea for review', 3),
  Review('htho379', 'No idea what to say either', 4),
  Review('ngocnhi', 'Neither do I', 2),
  Review('QueenMarika', 'The Great Elden Ring was shattered', 5),
  Review('Radagon', 'I am of the Golden Order', 2),
];
