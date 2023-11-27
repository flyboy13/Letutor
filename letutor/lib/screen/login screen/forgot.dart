// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:email_validator/email_validator.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  ForgotScreenState createState() => ForgotScreenState();
}

class ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String error = "";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool passwordVisible = false;

    void signIn() {
      setState(() {
        error = "";
      });
      print("Email:  ");
      print(_passwordController.text);
      print("clicked SignUp");
      if (_emailController.text == 'letutor@gmail.com' &&
          _passwordController.text == '12345678') {
        context.go('/tutor');
      } else {
        setState(() {
          error = "Error: You type Email or Password wrong";
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidth * 0.05,
        title: Image.asset(
          "Let_logo.png",
          width: screenWidth * 0.15,
          // Adjust the logo width as needed
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Login Column
              Expanded(
                  flex: 1, // Adjust flex values as needed
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Card(
                      color: Colors.white,
                      elevation: 100,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        color: Colors.white,
                        width: screenWidth *
                            0.3, // Adjust the container width as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Forgot password',
                              style: TextStyle(
                                fontSize:
                                    screenWidth * 0.02, // Responsive font size
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 113, 240),
                              ),
                            ),

                            SizedBox(
                                height:
                                    screenHeight * 0.03), // Responsive spacing
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: screenWidth *
                                        0.01), // Responsive font size
                              ),
                            ),
                            SizedBox(
                                height:
                                    screenHeight * 0.01), // Responsive spacing
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
                            // SizedBox(
                            //     height:
                            //         screenHeight * 0.01), // Responsive spacing
                            // Align(
                            //   alignment: Alignment.topLeft,
                            //   child: Text(
                            //     'Password',
                            //     style: TextStyle(
                            //         fontSize: screenWidth *
                            //             0.01), // Responsive font size
                            //   ),
                            // ),
                            // SizedBox(
                            //     height:
                            //         screenHeight * 0.01), // Responsive spacing
                            // TextFormField(
                            //   controller: _passwordController,
                            //   decoration: InputDecoration(
                            //     suffixIcon: IconButton(
                            //       icon: Icon(
                            //         // Based on passwordVisible state choose the icon
                            //         passwordVisible
                            //             // ignore: dead_code
                            //             ? Icons.visibility
                            //             : Icons.visibility_off,
                            //         color: Theme.of(context).primaryColorDark,
                            //       ),
                            //       onPressed: () {
                            //         // Update the state i.e. toogle the state of passwordVisible variable
                            //         setState(() {
                            //           passwordVisible = !passwordVisible;
                            //         });
                            //       },
                            //     ),
                            //     fillColor: Colors.white,
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //   ),
                            //   keyboardType: TextInputType.emailAddress,
                            //   style: const TextStyle(
                            //     fontFamily: "Poppins",
                            //   ),
                            // ),
                            // SizedBox(
                            // height:
                            //     screenHeight * 0.02), // Responsive spacing
                            // Align(
                            //   alignment: Alignment.topLeft,
                            //   child: TextButton(
                            //     style: TextButton.styleFrom(
                            //       textStyle: TextStyle(
                            //           fontSize: screenWidth *
                            //               0.03), // Responsive font size
                            //     ),
                            //     onPressed: () {},
                            //     child: Text(
                            //       'Forgot Password?',
                            //       style: TextStyle(
                            //           fontSize: screenWidth *
                            //               0.01), // Responsive font size
                            //     ),
                            //   ),
                            // ),

                            SizedBox(
                                height:
                                    screenHeight * 0.02), // Responsive spacing
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                error,
                                style: TextStyle(
                                    fontSize: screenWidth *
                                        0.01), // Responsive font size
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.02),
                            Align(
                                alignment: Alignment.center,
                                child: // Responsive spacing
                                    ElevatedButton(
                                  onPressed: signIn,
                                  child: Text(
                                    'Get Code',
                                    style: TextStyle(
                                        fontSize: screenWidth *
                                            0.02), // Responsive font size
                                  ),
                                )),
                            SizedBox(height: screenHeight * 0.04),
                            // Align(
                            //     alignment: Alignment.center,
                            //     child: // Responsive spacing
                            //         Text(
                            //       'Or continue with',
                            //       style: TextStyle(
                            //           fontSize: screenWidth *
                            //               0.01), // Responsive font size
                            //     )),

                            // SizedBox(
                            //     height:
                            //         screenHeight * 0.03), // Responsive spacing
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     FloatingActionButton(
                            //       disabledElevation: 0,
                            //       backgroundColor:
                            //           const Color.fromARGB(0, 255, 255, 255),
                            //       onPressed: () {},
                            //       child:
                            //           ClipOval(child: Image.asset("flogo.png")),
                            //     ),
                            //     SizedBox(
                            //         width: screenWidth *
                            //             0.03), // Responsive spacing
                            //     FloatingActionButton(
                            //       disabledElevation: 0,
                            //       backgroundColor:
                            //           const Color.fromARGB(0, 255, 255, 255),
                            //       onPressed: () {},
                            //       child: Image.asset("glogo.png"),
                            //     ),
                            //     SizedBox(
                            //         width: screenWidth *
                            //             0.03), // Responsive spacing
                            //     FloatingActionButton(
                            //       disabledElevation: 0,
                            //       backgroundColor:
                            //           const Color.fromARGB(0, 255, 255, 255),
                            //       onPressed: () {},
                            //       child: Image.asset("mlogo.png"),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //     height:
                            //         screenHeight * 0.06), // Responsive spacing
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "Not a member yet?",
                            //       style: TextStyle(
                            //           fontSize: screenWidth *
                            //               0.01 // Responsive font size
                            //           ),
                            //     ),
                            //     TextButton(
                            //       onPressed: () {
                            //         context.go('/signup');
                            //       },
                            //       child: Text(
                            //         'Sign Up',
                            //         style: TextStyle(
                            //             fontSize: screenWidth *
                            //                 0.015), // Responsive font size
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  )),

              // Picture Column
              // Expanded(
              //   flex: 2, // Adjust flex values as needed
              //   child: Container(
              //     padding: const EdgeInsets.all(8),
              //     alignment: Alignment.center,
              //     child: Image.asset(
              //       "assets/login.png",
              //       fit: BoxFit.fill,
              //       // Responsive image height
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}