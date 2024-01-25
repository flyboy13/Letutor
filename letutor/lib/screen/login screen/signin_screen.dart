// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:email_validator/email_validator.dart';
import 'package:letutor/database/service/user_api.dart';
import 'package:letutor/model/appbar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String error = "";
  void onSignInSuccess() {
    Get.offNamed('/tutor');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool passwordVisible = false;
    final userApi = UserApi();

    Future<void> signIn() async {
      setState(() {
        error = "";
      });
      print("Email:  ");
      print(_emailController.text);
      print("clicked SignIn");

      try {
        // if (_emailController.text == 'letutor@gmail.com' &&
        //     _passwordController.text == '12345678') {
        //   context.go('/tutor');
        // } else {
        //   setState(() {
        //     error = "Error: You type Email or Password wrong";
        //   });
        // }
        if (_emailController.text == "" || _passwordController.text == "") {
          error = "Please enter Email and Password";
        } else {
          var check = await userApi.login(
              email: _emailController.text, password: _passwordController.text);
          print("Check: $check");
          if (check == true) {
            onSignInSuccess();
          } else {
            error = "Error: You type Email or Password wrong";
          }
        }
      } catch (e) {
        setState(() {
          error = "Error: You type Email or Password wrong";
        });
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(toolbarHeight: screenWidth * 0.05, title: appbar(context)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Login Column
              Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Card(
                  color: Colors.white,
                  elevation: 100,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    color: Colors.white,
                    width: screenWidth *
                        0.9, // Adjust the container width as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Say hello to your English tutors',
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.05, // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 113, 240),
                          ),
                        ),
                        SizedBox(
                            height: screenHeight * 0.015), // Responsive spacing
                        Text(
                          'Become fluent faster through one-on-one video chat lessons tailored to your goals.',
                          style: TextStyle(
                              fontSize:
                                  screenWidth * 0.03), // Responsive font size
                        ),
                        SizedBox(
                            height: screenHeight * 0.03), // Responsive spacing
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontSize:
                                    screenWidth * 0.03), // Responsive font size
                          ),
                        ),
                        SizedBox(
                            height: screenHeight * 0.01), // Responsive spacing
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'mail@gmail.com',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please input email!";
                            }
                            if (!EmailValidator.validate(value)) {
                              return "Please input valid email!";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(
                            height: screenHeight * 0.01), // Responsive spacing
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Password',
                            style: TextStyle(
                                fontSize:
                                    screenWidth * 0.03), // Responsive font size
                          ),
                        ),
                        SizedBox(
                            height: screenHeight * 0.01), // Responsive spacing
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible
                                    // ignore: dead_code
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(
                            height: screenHeight * 0.01), // Responsive spacing
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                  fontSize: screenWidth *
                                      0.01), // Responsive font size
                            ),
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: screenWidth *
                                      0.025), // Responsive font size
                            ),
                          ),
                        ),

                        // SizedBox(
                        //     height: screenHeight * 0.0), // Responsive spacing
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            error,
                            style: TextStyle(
                                fontSize: screenWidth * 0.02,
                                color:
                                    Colors.red[400]), // Responsive font si,ze
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        Align(
                            alignment: Alignment.center,
                            child: // Responsive spacing
                                ElevatedButton(
                              onPressed: signIn,
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                    fontSize: screenWidth *
                                        0.04), // Responsive font size
                              ),
                            )),
                        SizedBox(height: screenHeight * 0.04),
                        Align(
                            alignment: Alignment.center,
                            child: // Responsive spacing
                                Text(
                              'Or continue with',
                              style: TextStyle(
                                  fontSize: screenWidth *
                                      0.03), // Responsive font size
                            )),

                        SizedBox(
                            height: screenHeight * 0.03), // Responsive spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              disabledElevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(0, 255, 255, 255),
                              onPressed: () {},
                              child: ClipOval(
                                  child: Image.asset("assets/flogo.png")),
                            ),
                            SizedBox(
                                width:
                                    screenWidth * 0.03), // Responsive spacing
                            FloatingActionButton(
                              heroTag: null,
                              disabledElevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(0, 255, 255, 255),
                              onPressed: () {},
                              child: Image.asset("assets/glogo.png"),
                            ),
                            SizedBox(
                                width:
                                    screenWidth * 0.03), // Responsive spacing
                            FloatingActionButton(
                              heroTag: null,
                              disabledElevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(0, 255, 255, 255),
                              onPressed: () {},
                              child: Image.asset("assets/mlogo.png"),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: screenHeight * 0.02), // Responsive spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Not a member yet?",
                              style: TextStyle(
                                  fontSize:
                                      screenWidth * 0.03 // Responsive font size
                                  ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offNamed('/signup');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: screenWidth *
                                        0.03), // Responsive font size
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Picture Column
              Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/login.png",
                  fit: BoxFit.fill,
                  // Responsive image height
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
