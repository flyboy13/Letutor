// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:letutor/database/data/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenApi {
  var timeOut = 60000;
  static const log = true;
  static const accessToken = 'Authorization';
  static AppStorage storage = AppStorage();

  // singleton
  static final AuthenApi instance = AuthenApi._internal();

  factory AuthenApi() {
    return instance;
  }

  AuthenApi._internal();

  late String baseUrl;
  late Map<String, dynamic> headers;

  Future<void> init(String baseUrl, {String? accessToken}) async {
    this.baseUrl = baseUrl;
    storage.init();
    String? getToken = await storage.getToken();
    if (getToken != null) {
      setToken(getToken);
      // String? getToken = await storage.getToken();
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $getToken'
      };
    } else {
      headers = {
        'Content-Type': 'application/json',
      };
    }
  }

  Future<void> setToken(String token) async {
    await storage.saveToken(token);

    String? getToken = await storage.getToken();
    print ("getToken: $getToken");
    headers[accessToken] = "Bearer $getToken";
    // print(headers);
  }

  void clearToken() {
    headers.remove(accessToken);
  }

  static Dio getDio() {
    var dio = Dio(instance.getDioBaseOption());

    return dio;
  }

  BaseOptions getDioBaseOption() {
    return BaseOptions(
      baseUrl: instance.baseUrl,
      connectTimeout: Duration(milliseconds: timeOut),
      receiveTimeout: Duration(milliseconds: timeOut),
      headers: instance.headers,
      responseType: ResponseType.json,
    );
  }
}
