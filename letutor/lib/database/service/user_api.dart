// ignore_for_file: unused_local_variable, unused_import, avoid_print
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:letutor/common/constant.dart';
import 'package:letutor/database/data/storage.dart';
import 'package:letutor/database/service/tutor_api.dart';
import 'package:letutor/model/user.dart';
import 'package:letutor/screen/home%20screen/tutor_controller.dart';
import '../../provider/base_services.dart';

class UserApi extends BaseService {
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  BuildContext? get context => null;

  Future<bool> login({required String email, required String password}) async {
    final body = {"email": email, "password": password};
    late var response;
    try {
      response = await post(API.login, data: body);
    } catch (e) {
      print("===========================");
      print(e);
      print("===========================");
      return false;
    }

    // print("Respone: ${response.body}");
    if (response.statusCode == 200) {
      saveUser(response);

      if (!Get.isRegistered<TutorApi>()) {
        Get.put(TutorApi());
      }
      if (!Get.isRegistered<UserApi>()) {
        Get.put(UserApi());
      }

      if (!Get.isRegistered<TutorController>()) {
        Get.put(TutorController());
      }
    }
    return true;
  }

  Future<void> signUp({required String email, required String password}) async {
    final body = {"email": email, "password": password};
    var response = await post(API.signup, data: body);
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
    try {
      final response = await put(API.userInfor, data: body);
      appController.userModel.value = User.fromJson(response);
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
        content: Center(child: Text('Update Avatar Successfull!')),
      ));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//
// Future<void> getlanguages() async {
//   final response = await get(GET_LANGUAGES);
//   saveLanguages(response);
// }
}
