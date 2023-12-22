import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:letutor/control/app.dart';
import 'package:letutor/control/base_controller.dart';
import 'package:letutor/database/service/user_api.dart';
import 'package:letutor/model/date_time.dart';
import 'package:letutor/model/user.dart';

class ProfileController extends BaseController {
  final _appController = Get.find<App>();
  final _userService = Get.find<UserApi>();
  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      'nameField',
      'emailField',
      'countryField',
      'phoneField',
      'birthdayField',
      'levelField',
      //wantToLearnField
      'studyScheduleField',
    ].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );
  List<String> wantToLearnField = [];
  Rx<User> user = User(birthday: DateTime(1990)).obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    setUpDataProfile();
  }

  void onReloadData() {}

  void setUpDataProfile() async {
    await _userService.getUserInfo();
    user.value = _appController.userModel.value!;

    controllers['nameField']?.text = user.value.name;
    controllers['emailField']?.text = user.value.email;
    controllers['countryField']?.text = user.value.country;
    controllers['phoneField']?.text = user.value.phone;
    controllers['birthdayField']?.text =
        DateFormat(time1).format(user.value.birthday);
    controllers['levelField']?.text = user.value.level;
    controllers['studyScheduleField']?.text = user.value.studySchedule;
    isLoading.value = false;
  }

  void updateProfile() async {
    {
      User userModel = User(
        name: controllers['nameField']!.value.text,
        // email: controllers[emailField]!.value.text,
        country: controllers['countryField']!.value.text,
        phone: controllers['phoneField']!.value.text,
        birthday: controllers['birthdayField']?.text != null
            ? DateTime.parse(controllers['birthdayField']!.value.text)
            : DateTime(1990),
        level: controllers['levelField']!.value.text,
        studySchedule: controllers['studyScheduleField']!.value.text,
      );
      await _userService.updateUserInfo(user: userModel);
      // setUpDataProfile();
      // notifyBar(message: 'Cập nhật thành công', isSuccess: true);
    }
  }
}
