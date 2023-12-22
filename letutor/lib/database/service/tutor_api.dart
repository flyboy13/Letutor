import 'package:letutor/common/constant.dart';
import 'package:letutor/database/service/model_service.dart';
import 'package:letutor/model/tutor.dart';
import 'package:sprintf/sprintf.dart';

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
    final response = await get(sprintf(API.getTutor, [tutorId]));
    return Tutor.fromJson(response);
  }

  Future<dynamic> getSchedule(String tutorId) async {
    // final data = {
    //   'tutorId': tutorId,
    //   'startTimestamp': 1670086800000,
    //   'endTimestamp': 1670691599999,
    // };
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

  Future<dynamic> getReviewByTeacherId(String tutorId, {int page = 1}) async {
    final response = await get(sprintf(API.reviewTutor, [tutorId, page]));
    return response;
  }
}
