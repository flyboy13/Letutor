import 'package:dio/dio.dart';

class AuthenApi {
  var timeOut = 60000;
  static const log = true;
  static const ACCESS_TOKEN_HEADER = 'Authorization';

  // singleton
  static final AuthenApi instance = AuthenApi._internal();

  factory AuthenApi() {
    return instance;
  }

  AuthenApi._internal();

  late String baseUrl;
  late Map<String, dynamic> headers;

  void init(String baseUrl, {String? accessToken}) {
    this.baseUrl = baseUrl;
    headers = {
      'Content-Type': 'application/json',
    };
    if (accessToken != null) setToken(accessToken);
  }

  void setToken(String token) {
    headers[ACCESS_TOKEN_HEADER] = "Bearer $token";
  }

  void clearToken() {
    headers.remove(ACCESS_TOKEN_HEADER);
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
