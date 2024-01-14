import 'package:get_storage/get_storage.dart';

class AppStorage {
  static const sharedReference = "lettutor_storage";

  static const userInfor = "app_user_info";
  static const userToken = "user_token";
  // static const APP_THEME = "app_theme";

  init() async {
    await GetStorage.init(sharedReference);
    box = GetStorage(sharedReference);
  }

  GetStorage box = GetStorage(sharedReference);

  Future<void> saveToken(String refreshToken) async {
    box.write(userToken, refreshToken);
  }

  Future<String?> getToken() async {
    final token = await box.read(userToken);
    return token;
  }

  Future<void> logout() async {
    if (box.hasData(userToken)) await box.remove(userToken);
    if (box.hasData(userInfor)) await box.remove(userInfor);
  }
}
