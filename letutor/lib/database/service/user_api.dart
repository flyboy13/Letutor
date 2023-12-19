// ignore_for_file: unused_local_variable
import 'package:intl/intl.dart';
import 'package:letutor/common/constant.dart';
import 'package:letutor/model/user.dart';
import '../../provider/base_services.dart';

class UserApi extends BaseService {
  Future<void> loginAccount(
      {required String email, required String password}) async {
    final body = {"email": email, "password": password};
    final response = await post(API.login, data: body);

    saveUser(response);
  }

  Future<void> registerAccount(
      {required String email, required String password}) async {
    final body = {"email": email, "password": password};
    final response = await post(API.signup, data: body);
  }

  Future<void> forgotPassword({required String email}) async {
    final body = {"email": email};
    final response = await post(API.forgotPassword, data: body);
  }

  Future<dynamic> getSchedule({page = 1, type = 0}) async {
    final data = type == 0
        ? {
            'page': page,
            'perPage': 20,
            'dateTimeGte': DateTime.now()
                .millisecondsSinceEpoch
                .toString()
                .substring(0, 13),
            'orderBy': 'meeting',
            'sortBy': 'desc',
          }
        : {
            'page': page,
            'perPage': 20,
            'dateTimeLte': DateTime.now()
                .millisecondsSinceEpoch
                .toString()
                .substring(0, 13),
            'orderBy': 'meeting',
            'sortBy': 'desc',
          };
    final response = await get(API.scheduelAll, params: data);
    return response;
  }

  Future<void> getUserInfo() async {
    final response = await get(API.userInfor);
    appController.userModel.value = User.fromJson(response['user']);
  }

  Future<void> updateUserInfo({required User user}) async {
    final body = {
      'name': user.name,
      // 'email': user.email,
      'country': user.country,
      // 'learnTopics': user.learnTopics,
      'phone': user.phone,
      'birthday': DateFormat('yyyy-MM-dd').format(user.birthday),
      'level': user.level,
      'studySchedule': user.studySchedule,
      // 'testPreparations': user.testPreparations
    };
    final response = await put(API.userInfor, data: body);
    appController.userModel.value = User.fromJson(response);
  }

//
// Future<void> getlanguages() async {
//   final response = await get(GET_LANGUAGES);
//   saveLanguages(response);
// }
}
