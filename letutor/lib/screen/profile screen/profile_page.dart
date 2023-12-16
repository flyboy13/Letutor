import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:letutor/model/appbar.dart';
import 'package:letutor/model/countries.dart';
import 'package:letutor/database/service/user_api.dart';
import 'package:letutor/screen/profile%20screen/components/birthday.dart';
import 'package:letutor/screen/profile%20screen/components/dropdown_menu.dart';
import 'package:letutor/screen/profile%20screen/components/email.dart';
import 'package:letutor/screen/profile%20screen/components/name.dart';
import 'package:letutor/screen/profile%20screen/components/phone.dart';
import 'package:provider/provider.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late DateTime _birthday;
  late String _phone;
  late String _name;
  late String _country;
  late String _level;
  late String _topicToLearn;
  late String _email;
  bool isInit = true;

  final ImagePicker _picker = ImagePicker();

  void setBirthday(DateTime birthday) {
    setState(() {
      _birthday = birthday;
    });
  }

  void setPhone(String phone) {
    setState(() {
      _phone = phone;
    });
  }

  void setName(String name) {
    setState(() {
      _name = name;
    });
  }

  void setEmail(String email) {
    setState(() {
      _email = email;
    });
  }

  void setCountry(String country) {
    setState(() {
      _country = country;
    });
  }

  void setLevel(String level) {
    setState(() {
      _level = level;
    });
  }

  void setTopicToLearn(String topicToLearn) {
    setState(() {
      _topicToLearn = topicToLearn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    final uploadImage = userProvider.uploadImage;

    setState(() {
      if (isInit) {
        _birthday = user.birthDay;
        _phone = user.phone;
        _name = user.fullName;
        _country = user.country;
        _level = user.level;
        _topicToLearn = user.topicToLearn;
        _email = user.email;
        isInit = false;
      }
    });

    void imgFromGallery() async {
      var pickedFile = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);

      if (pickedFile != null) {
        userProvider.uploadProfileImage(File(pickedFile.path));
      }
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
                            child: uploadImage != null
                                ? ClipRRect(
                                    // borderRadius: BorderRadius.circular(10),

                                    child:
                                        // Image.asset(uploadImage.path))
                                        Image.file(uploadImage!,
                                            fit: BoxFit.cover))
                                : ClipOval(
                                    // Wrap the Image.asset with ClipOval
                                    child: Image.asset("avatar1.png"),
                                  )),
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
                              child: Image.asset('edit.png')),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      user.fullName,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  NameEdit(changeName: setName, name: _name),
                  EmailEdit(changeEmail: setEmail, email: _email),
                  BirthdayEdition(
                      setBirthday: setBirthday, birthday: _birthday),
                  PhoneEdition(changePhone: setPhone, phone: _phone),
                  DropdownEdit(
                    title: "Country",
                    selectedItem: _country,
                    items: Countries.countries,
                    onChange: setCountry,
                  ),
                  DropdownEdit(
                    title: "My Level",
                    selectedItem: _level,
                    items: const ["Beginner", "Immediate", "Advanced"],
                    onChange: setLevel,
                  ),
                  DropdownEdit(
                    title: "Want to learn",
                    selectedItem: _topicToLearn,
                    items: const [
                      "TOEIC",
                      "IELTS",
                      "TOEFL",
                      'English for kids',
                      'English for Business',
                      'Conversational',
                      'STARTERS',
                      'MOVERS',
                      'FLYERS',
                    ],
                    onChange: setTopicToLearn,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_phone.isEmpty) {
                        } else {
                          userProvider.updateName(_name);
                          userProvider.updateBirthday(_birthday);
                          userProvider.updatePhone(_phone);
                          userProvider.updateCountry(_country);
                          userProvider.updateLevel(_level);
                          userProvider.updateTopicToLearn(_topicToLearn);
                          userProvider.updateEmail(_email);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Save profile success'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff007CFF),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(top: 13, bottom: 13),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
