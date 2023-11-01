import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                      elevation: 100,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        width: screenWidth *
                            0.5, // Adjust the container width as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Say hello to your English tutors',
                              style: TextStyle(
                                fontSize:
                                    screenWidth * 0.04, // Responsive font size
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 113, 240),
                              ),
                            ),
                            SizedBox(
                                height:
                                    screenHeight * 0.015), // Responsive spacing
                            Text(
                              'Become fluent faster through one-on-one video chat lessons tailored to your goals.',
                              style: TextStyle(
                                  fontSize: screenWidth *
                                      0.03), // Responsive font size
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
                                        0.02), // Responsive font size
                              ),
                            ),
                            SizedBox(
                                height:
                                    screenHeight * 0.01), // Responsive spacing
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'mail@gmail.com',
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            SizedBox(
                                height:
                                    screenHeight * 0.01), // Responsive spacing
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Password',
                                style: TextStyle(
                                    fontSize: screenWidth *
                                        0.02), // Responsive font size
                              ),
                            ),
                            SizedBox(
                                height:
                                    screenHeight * 0.01), // Responsive spacing
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            SizedBox(
                                height:
                                    screenHeight * 0.02), // Responsive spacing
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: screenWidth *
                                          0.03), // Responsive font size
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: screenWidth *
                                          0.02), // Responsive font size
                                ),
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.1),
                            Align(
                                alignment: Alignment.center,
                                child: // Responsive spacing
                                    ElevatedButton(
                                  onPressed: () {
                                    // Add your sign-in logic here
                                  },
                                  child: Text(
                                    'LOG IN',
                                    style: TextStyle(
                                        fontSize: screenWidth *
                                            0.025), // Responsive font size
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
                                          0.02), // Responsive font size
                                )),

                            SizedBox(
                                height:
                                    screenHeight * 0.03), // Responsive spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {},
                                  child: Image.asset("flogo.png"),
                                ),
                                SizedBox(
                                    width: screenWidth *
                                        0.03), // Responsive spacing
                                FloatingActionButton(
                                  onPressed: () {},
                                  child: Image.asset("glogo.png"),
                                ),
                                SizedBox(
                                    width: screenWidth *
                                        0.03), // Responsive spacing
                                FloatingActionButton(
                                  onPressed: () {},
                                  child: Image.asset("mlogo.png"),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    screenHeight * 0.06), // Responsive spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Not a member yet?",
                                  style: TextStyle(
                                      fontSize: screenWidth *
                                          0.02 // Responsive font size
                                      ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: screenWidth *
                                            0.02), // Responsive font size
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),

              // Picture Column
              Expanded(
                flex: 1, // Adjust flex values as needed
                child: Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/login.png",
                    fit: BoxFit.fill,
                    // Responsive image height
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
