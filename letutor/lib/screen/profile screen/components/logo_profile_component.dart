import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letutor/conponent/circle_box.dart';
import 'package:letutor/conponent/image_network_component.dart';
import 'package:letutor/control/app.dart';
import 'package:letutor/model/user.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';

class LogoProfileComponent extends GetWidget<ProfileController> {
  LogoProfileComponent({super.key});
  final user =
      Get.find<App>().userModel.value ?? User(birthday: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleBox(
          size: 130,
          child: ImageNetworkComponent(
            url: user.avatar,
          ),
        ),
        Positioned(
          left: 90,
          top: 90,
          child: InkWell(
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                controller.uploadPhotoProfile(image.path);
              }
            },
            child: CircleBox(
              size: 50,
              child: const Icon(
                Icons.edit,
                size: 30,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
