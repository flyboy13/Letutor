// ignore_for_file: constant_identifier_names, unused_import
import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/control/api_response.dart';
import 'package:letutor/control/app.dart';
import 'package:letutor/control/control_error_api.dart';
import 'package:letutor/database/data/storage.dart';
import 'package:letutor/database/service/authen_api.dart';
import 'package:letutor/model/user.dart';

enum JsonType { FULL_RESPONSE, JSON_RESPONSE, BODY_BYTES, STRING_RESPONSE }

abstract class BaseService {
  final appController = Get.put(App());

  Future<dynamic> get(String path,
      {Map<String, dynamic>? params,
      JsonType responseType = JsonType.FULL_RESPONSE}) async {
    late var response;
    try {
      response = await AuthenApi.getDio().get(path, queryParameters: params);
    } catch (e) {
      print(e);
      return;
    }
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> post(String path,
      {data,
      bool enableCache = false,
      JsonType responseType = JsonType.FULL_RESPONSE}) async {
    late var response;
    try {
      response = await AuthenApi.getDio().post(path, data: data);
    } catch (e) {
      print(e);
      return;
    }
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> patch(String path,
      {data, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await AuthenApi.getDio().patch(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> put(String path,
      {data, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await AuthenApi.getDio().put(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> delete(String path,
      {data, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await AuthenApi.getDio().delete(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  bool isSuccess(statusCode) => statusCode! >= 200 && statusCode! <= 299;

  dynamic _handleResponse(dio.Response response,  
      {JsonType responseType = JsonType.JSON_RESPONSE}) {
    if (isSuccess(response.statusCode)) {
      if (responseType == JsonType.JSON_RESPONSE) {
        return ApiResponse.fromJson(response.data).data;
      } else if (responseType == JsonType.FULL_RESPONSE) {
        return response.data;
      } else if (responseType == JsonType.STRING_RESPONSE) {
        return ApiResponse(
            statusCode: response.statusCode,
            message: response.data,
            error: response.data);
      } else if (responseType == JsonType.BODY_BYTES) {
        return ApiResponse(
            statusCode: response.statusCode,
            message: response.data,
            error: response.data);
      } else {
        return ControlErrorApi.fromJson(jsonDecode(response.data));
      }
    } else {
      return ControlErrorApi.fromJson(jsonDecode(response.data));
    }
  }

  String queryParam(String? id) {
    Map<String, String?> queryParams = {'status': 'ACTIVE', 'root': id};
    return jsonEncode(queryParams);
  }

  Future<void> saveUser(response) async {
    appController.userModel.value = User.fromJson(response['user']);
    AuthenApi.instance.setToken(response['tokens']['access']['token']);
  }
//
// void saveLanguages(response) {
//   _appController.saveLanguages(response);
// }
}
