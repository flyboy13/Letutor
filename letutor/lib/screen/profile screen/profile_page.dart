import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter/material.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/countries.dart';
import 'package:letutor/model/topic.dart';
import 'package:letutor/model/user.dart';
import 'package:letutor/screen/profile%20screen/components/birthday.dart';
import 'package:letutor/screen/profile%20screen/components/dropdown_menu.dart';
import 'package:letutor/screen/profile%20screen/components/email.dart';
import 'package:letutor/screen/profile%20screen/components/name.dart';
import 'package:letutor/screen/profile%20screen/components/phone.dart';
import 'package:letutor/screen/profile%20screen/components/profile_controller.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void imgFromGallery() async {
      // var pickedFile = await _picker.pickImage(
      //     source: ImageSource.gallery, imageQuality: 50);

      // if (pickedFile != null) {
      //   profileControler.uploadProfileImage(File(pickedFile.path));
      // }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width * 0.05,
          title: appbar(context),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
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
                            child: Image.asset("avatar1.png"),
                          )),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: imgFromGallery,
                          child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              radius: 10,
                              child: Image.asset('edit.png')),
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
                  // NameEdit(changeName: setName, name: _name),
                  // EmailEdit(changeEmail: setEmail, email: _email),
                  // BirthdayEdition(
                  //     setBirthday: setBirthday, birthday: _birthday),
                  // PhoneEdition(changePhone: setPhone, phone: _phone),
                  // DropdownEdit(
                  //   title: "Country",
                  //   selectedItem: _country,
                  //   items: Countries.countries,
                  //   onChange: setCountry,
                  // ),
                  // DropdownEdit(
                  //   title: "My Level",
                  //   selectedItem: _level,
                  //   items: const ["Beginner", "Immediate", "Advanced"],
                  //   onChange: setLevel,
                  // ),
                  // DropdownEdit(
                  //   title: "Want to learn",
                  //   selectedItem: _topicToLearn,
                  //   items: const [
                  //     "TOEIC",
                  //     "IELTS",
                  //     "TOEFL",
                  //     'English for kids',
                  //     'English for Business',
                  //     'Conversational',
                  //     'STARTERS',
                  //     'MOVERS',
                  //     'FLYERS',
                  //   ],
                  //   onChange: setTopicToLearn,
                  // ),

                  Obx(
                    () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            onChanged: (value) => {},
                            controller: controller.controllers['nameField'],
                          ),
                        ]),
                  ),

                  //Todo: submit
                  // Container(
                  //   margin: const EdgeInsets.only(top: 20, bottom: 20),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       if (_phone.isEmpty) {
                  //       } else {
                  //         //Todo: update profile here
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           const SnackBar(
                  //             content: Text('Save profile success'),
                  //             duration: Duration(seconds: 2),
                  //           ),
                  //         );
                  //       }
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color(0xff007CFF),
                  //       shape: const RoundedRectangleBorder(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(10))),
                  //     ),
                  //     child: Container(
                  //       padding: const EdgeInsets.only(top: 13, bottom: 13),
                  //       child: const Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text(
                  //             "Save",
                  //             style: TextStyle(color: Colors.white),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
