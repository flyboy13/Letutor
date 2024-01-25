// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:get/get_connect/http/src/status/http_status.dart';

import 'package:letutor/common/constant.dart';

import 'package:letutor/database/service/model_service.dart';

import 'package:letutor/model/tutor.dart';

import 'package:sprintf/sprintf.dart';
import 'package:http/http.dart' as http;

class TutorApi extends ModelService {
  Future<dynamic> getAllTutorByPage({int page = 1}) async {
    final response = await get(sprintf(API.listTutor, [page]));

    return response;
  }

  Future<dynamic> getAllTutorBySearch(
      {int page = 1,
      String search = '',
      String? date,
      List<String> specialties = const [],
      List<double?> time = const [null, null],
      nationality = const {}}) async {
    final body = {
      "filters": {
        "date": date,
        "nationality": nationality,
        "specialties": specialties,
        "tutoringTimeAvailable": time,
      },
      "page": page,
      "perPage": 9,
      "search": search
    };

    final response = await post(API.searchTutor, data: body);

    return response;
  }

  Future<Tutor> getTutorById(String tutorId) async {
    final response = await get('tutor/$tutorId');

    return Tutor.fromJson(response);
  }

  Future<dynamic> getSchedule(String tutorId) async {
    final data = {
      'tutorId': tutorId,
      'startTimestamp': DateTime.now()
          .subtract(const Duration(days: 1))
          .millisecondsSinceEpoch
          .toString()
          .substring(0, 13),
      'endTimestamp': DateTime.now()
          .add(const Duration(days: 5))
          .millisecondsSinceEpoch
          .toString()
          .substring(0, 13),
    };

    final response = await get(API.scheduel, params: data);

    return response;
  }

  Future<bool> checkUrl(String url) async {
    print('check URL');
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.notModified) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> manageTeacherFavorite(String id) async {
    final response = await post(API.addFavourite, data: {'tutorId': id});

    return response;
  }

  Future<dynamic> getReviewByTeacherId(String tutorId, {int page = 1}) async {
    final response = await get(sprintf(API.reviewTutor, [tutorId, page]));

    return response;
  }

  //  Future<dynamic> bookSchedule({required String scheduleDetailIds}) async {

  //   final data = {

  //     'scheduleDetailIds': [scheduleDetailIds],

  //     'note': '',

  //   };

  //   final response = await post(API., data: data);

  //   return response;

  // }

  Future<dynamic> reportTutor(String text, String tutorId) async {
    final body = {'content': text, 'tutorId': tutorId};

    try {
      await post(API.report, data: body);

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
