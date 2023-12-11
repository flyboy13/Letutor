// ignore_for_file: avoid_print

import 'package:letutor/model/book.dart';
import 'package:letutor/control/feedback.dart';
import 'package:letutor/model/schedule.dart';
import 'package:letutor/control/tutor.dart';
import 'package:letutor/control/user.dart';
import 'package:uuid/uuid.dart';

import '../control/course.dart';

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

class CoursesSample {
  static List<Course> courses = [
    Course(
      id: uuid.v4(),
      title: "Basic Conversation Topics",
      image: "asset/img/sample/course/sample_1.png",
      about: "Gain confidence speaking about familiar topics",
      level: "Beginner",
      overview: {
        "Why take this course":
            "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
        "What will you be able to do":
            "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
      },
      topics: [
        "Foods You Love",
        "Your Job",
        "Playing and Watching Sports",
        "The Best Pet",
        "Having Fun in Your Free Time",
        "Your Daily Routine",
        "Childhood Memories",
        "Your Family Members",
        "Your Hometown",
        "Shopping Habits"
      ],
      tutors: [SampleTutor.tutor[0]],
    ),
    Course(
      id: uuid.v4(),
      title: "Intermediate Conversation Topics",
      image: "asset/img/sample/course/sample_2.png",
      about: "Express your ideas and opinions",
      level: "Intermediate",
      overview: {
        "Why take this course":
            "Looking for some variety in your lesson topics? Immerse yourself in English discussion with this set of engaging topics.",
        "What will you be able to do":
            "This course covers vocabulary at the CEFR B1-B2 levels. You will work on improving fluency and comprehension by discussing a variety of topics. In addition, you will receive corrections from a native English speaker to help improve your grammatical accuracy.",
      },
      topics: [
        "Cooking",
        "Your Dream Job",
        "Sports Fitness",
        "Service Animals",
        "Social Activities",
        "Your Ideal Day",
        "Childhood Friendships",
        "The Importance of Family",
        "City Life",
        "Online Shopping"
      ],
      tutors: [SampleTutor.tutor[1]],
    ),
    Course(
      id: uuid.v4(),
      title: "Healthy Mind, Healthy Body",
      image: "asset/img/sample/course/sample_3.png",
      about: "Let's discuss the many aspects of living a long, happy life",
      level: "Intermediate",
      overview: {
        "Why take this course":
            "Looking for some variety in your lesson topics? Immerse yourself in English discussion with this set of engaging topics.",
        "What will you be able to do":
            "Discuss topics related to physical, mental, and emotional health. Learn about other cultures along the way in friendly conversations with tutors.",
      },
      topics: [
        "You Are What You Eat",
        "Health and Fitness",
        "Drink Up",
        "Getting Some Zizz",
        "Calm and RnB",
        "Look On The Bright Side",
      ],
      tutors: [SampleTutor.tutor[2]],
    ),
    Course(
      id: uuid.v4(),
      title: "Movies and Television",
      image: "asset/img/sample/course/sample_4.png",
      about:
          "Let's discuss our preferences and habits surrounding movies and television shows",
      level: "Beginner",
      overview: {
        "Why take this course":
            "Movies and television shows are common topics of conversation among friends and coworkers. In this course, you will practice discussing the movies and television shows you've seen and sharing your opinions about them.",
        "What will you be able to do":
            "You will learn vocabulary related to movies and television. In addition, you will practice the grammatical structures that help you tell a story, and share and explain your likes and dislikes.",
      },
      topics: [
        "Your Favorite Movie",
        "Your Favorite TV shows",
        "Film Production",
        "The World of Streaming",
        "Competition Shows",
        "Reality TV",
        "TV And Movie Characters",
        "Animated Movies And TV Series",
        "Movies Around the World",
        "The Future of Entertainment"
      ],
      tutors: [SampleTutor.tutor[3]],
    ),
  ];
}

class BooksSample {
  static List<Book> books = [
    Book(
      id: uuid.v4(),
      name: "What a world 1",
      description:
          "For teenagers who have an excellent vocabulary background and brilliant communication skills.",
      img: "asset/img/sample/book/sample_1.jpeg",
      level: 'Beginner',
    ),
    Book(
      id: uuid.v4(),
      name: "Let's go starter",
      description:
          "For kids who start learning English the first time or speak a little English only.",
      img: "asset/img/sample/book/sample_2.jpeg",
      level: 'Beginner',
    ),
    Book(
      id: uuid.v4(),
      name: "Let's go begin",
      description:
          "For kids who start learning English the first time or speak a little English only (reading skills are limited).",
      img: "asset/img/sample/book/sample_3.jpeg",
      level: 'Beginner',
    ),
    Book(
      id: uuid.v4(),
      name: "Family and friends starter",
      description:
          "For kids who want to learn English through pictures, pick up simple vocabulary and simple structures.",
      img: "asset/img/sample/book/sample_4.jpeg",
      level: 'Beginner',
    ),
    Book(
      id: uuid.v4(),
      name: "Everybody up starter",
      description:
          "For: kids who want to learn English through pictures, pick up simple vocabulary and simple structures.",
      img: "asset/img/sample/book/sample_5.png",
      level: 'Beginner',
    ),
    Book(
      id: uuid.v4(),
      name: "Cambridge story fun for starters",
      description:
          "For kids who can handle single words and simple sentences with assistance.",
      img: "asset/img/sample/book/sample_6.jpeg",
      level: 'Beginner',
    ),
    Book(
      id: uuid.v4(),
      name: "NEW HEADWAY ELEMENTARY",
      description:
          "For teenagers who want to form a grammatical background as well as reading and writing ones.",
      img: "asset/img/sample/book/sample_7.jpeg",
      level: 'Beginner',
    ),
    Book(
      id: uuid.v4(),
      name: "English world (Macmillan Young Learners) 1",
      description:
          "For kids who are able to pick up simple sounds, letters, words and learn new things by using pictures.",
      img: "asset/img/sample/book/sample_8.jpeg",
      level: 'Beginner',
    ),
  ];
}

List<Course> courses = [
  Course(
    id: uuid.v4(),
    title: "Basic Conversation Topics",
    image: "asset/img/sample/course/sample_1.png",
    about: "Gain confidence speaking about familiar topics",
    level: "Beginner",
    overview: {
      "Why take this course":
          "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
      "What will you be able to do":
          "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
    },
    topics: [
      "Foods You Love",
      "Your Job",
      "Playing and Watching Sports",
      "The Best Pet",
      "Having Fun in Your Free Time",
      "Your Daily Routine",
      "Childhood Memories",
      "Your Family Members",
      "Your Hometown",
      "Shopping Habits"
    ],
    tutors: [SampleTutor.tutor[0]],
  ),
  Course(
    id: uuid.v4(),
    title: "Intermediate Conversation Topics",
    image: "asset/img/sample/course/sample_2.png",
    about: "Express your ideas and opinions",
    level: "Intermediate",
    overview: {
      "Why take this course":
          "Looking for some variety in your lesson topics? Immerse yourself in English discussion with this set of engaging topics.",
      "What will you be able to do":
          "This course covers vocabulary at the CEFR B1-B2 levels. You will work on improving fluency and comprehension by discussing a variety of topics. In addition, you will receive corrections from a native English speaker to help improve your grammatical accuracy.",
    },
    topics: [
      "Cooking",
      "Your Dream Job",
      "Sports Fitness",
      "Service Animals",
      "Social Activities",
      "Your Ideal Day",
      "Childhood Friendships",
      "The Importance of Family",
      "City Life",
      "Online Shopping"
    ],
    tutors: [SampleTutor.tutor[1]],
  ),
  Course(
    id: uuid.v4(),
    title: "Healthy Mind, Healthy Body",
    image: "asset/img/sample/course/sample_3.png",
    about: "Let's discuss the many aspects of living a long, happy life",
    level: "Intermediate",
    overview: {
      "Why take this course":
          "Looking for some variety in your lesson topics? Immerse yourself in English discussion with this set of engaging topics.",
      "What will you be able to do":
          "Discuss topics related to physical, mental, and emotional health. Learn about other cultures along the way in friendly conversations with tutors.",
    },
    topics: [
      "You Are What You Eat",
      "Health and Fitness",
      "Drink Up",
      "Getting Some Zizz",
      "Calm and RnB",
      "Look On The Bright Side",
    ],
    tutors: [SampleTutor.tutor[2]],
  ),
  Course(
    id: uuid.v4(),
    title: "Movies and Television",
    image: "asset/img/sample/course/sample_4.png",
    about:
        "Let's discuss our preferences and habits surrounding movies and television shows",
    level: "Beginner",
    overview: {
      "Why take this course":
          "Movies and television shows are common topics of conversation among friends and coworkers. In this course, you will practice discussing the movies and television shows you've seen and sharing your opinions about them.",
      "What will you be able to do":
          "You will learn vocabulary related to movies and television. In addition, you will practice the grammatical structures that help you tell a story, and share and explain your likes and dislikes.",
    },
    topics: [
      "Your Favorite Movie",
      "Your Favorite TV shows",
      "Film Production",
      "The World of Streaming",
      "Competition Shows",
      "Reality TV",
      "TV And Movie Characters",
      "Animated Movies And TV Series",
      "Movies Around the World",
      "The Future of Entertainment"
    ],
    tutors: [SampleTutor.tutor[3]],
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
