import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/model/user.dart';
import 'package:letutor/database/data/storage.dart';
import 'package:letutor/database/service/authen_api.dart';
import 'package:letutor/database/service/user_api.dart';

enum AuthState { unauthorized, authorized }

class App extends GetxController {
  late Rx<Locale?> locale;
  late Rx<ThemeData?> themeData;
  final Rx<User?> userModel = User(birthday: DateTime(2023)).obs;
  final Rx<AuthState> authState = AuthState.unauthorized.obs;

  init() async {
    await Future.wait([initStorage()]);
    Get.find<AppStorage>();

    setupApp();
    await initApi(null);
  }

  void setupApp() {
    Get.put(UserApi());
  }

  initApi(String? accessToken) async {
    String baseUrl = 'https://sandbox.api.lettutor.com/';
    // init api
    AuthenApi.instance.init(baseUrl, accessToken: accessToken ?? "");
  }

  Future<void> initStorage() async {
    await Get.put(AppStorage()).init();
  }

  logout() async {
    userModel.value = User(birthday: DateTime(2002));
    authState.value = AuthState.unauthorized;
    AuthenApi.instance.clearToken();
    await Get.find<AppStorage>().logout();
  }
}
