import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letutor/conponent/image_network_component.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/screen/profile%20screen/components/birthday.dart';
import 'package:letutor/screen/profile%20screen/components/contry.dart';
import 'package:letutor/screen/profile%20screen/components/email.dart';
import 'package:letutor/screen/profile%20screen/components/my_level.dart';
import 'package:letutor/screen/profile%20screen/components/name.dart';
import 'package:letutor/screen/profile%20screen/components/phone.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';
import 'package:letutor/screen/profile%20screen/components/study_schedule.dart';
import 'package:letutor/screen/profile%20screen/components/want_to_learn.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void imgFromGallery() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        controller.uploadPhotoProfile(image.path);
      }
    }

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width * 0.05,
          title: appbar(context),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(right: 15, left: 15),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          child: ImageNetworkComponent(
                            url: controller.user.value.avatar,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: imgFromGallery,
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            radius: 10,
                            child: Image.asset('assets/edit.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      controller.user.value.name,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    controller.user.value.email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  NameEdit(
                    controller: controller.controllers['nameField'],
                  ),
                  EmailEdit(
                    controller: controller.controllers['emailField'],
                  ),
                  ContryEdit(controller: controller),
                  PhoneEdit(controller: controller.controllers['phoneField']),
                  BirthdayEdit(controller: controller),
                  LevelEdit(
                    controller: controller,
                  ),
                  WantToLearnEdit(controller: controller),
                  StudyScheduleEdit(
                    controller: controller.controllers['studyScheduleField'],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.updateProfile();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Center(
                                    child:
                                        Text('Update Profile Successfull!'))));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 71, 135, 255),
                        minimumSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.off('/signin');
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Center(
                                    child: Text('Log out Successfull!'))));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 248, 28, 58),
                        minimumSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Log out',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
