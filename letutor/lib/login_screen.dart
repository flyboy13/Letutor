import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Image.asset(
            "Let_logo.png",
            width: 200,
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FractionColumnWidth(0.4),
                1: FractionColumnWidth(0.6),
              },
              children: [
                TableRow(
                  children: [
                    // Login Column,
                    Column(children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                            elevation: 50,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Container(
                                padding: const EdgeInsets.all(50.0),
                                width: 600,
                                child: Column(
                                  children: [
                                    const Text(
                                      'Say hello to your English tutors',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 0, 113, 240)),
                                    ),
                                    const SizedBox(height: 18),
                                    const Text(
                                      'Become fluent faster through one on one video chat lessons tailored to your goals.',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(height: 32),
                                    const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Email',
                                          style: TextStyle(fontSize: 14),
                                        )),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'mail@gmail.com',
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(),
                                        ),
                                        //fillColor: Colors.green
                                      ),
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Email cannot be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const SizedBox(height: 8),
                                    const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Password',
                                          style: TextStyle(fontSize: 14),
                                        )),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(),
                                        ),
                                        //fillColor: Colors.green
                                      ),
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Email cannot be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                              fontSize:
                                                  16, // Adjust the font size as needed
                                            ),
                                          ),
                                        )),
                                    const SizedBox(height: 24),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Add your sign in logic here
                                      },
                                      child: const Text(
                                        'LOG IN',
                                        style: TextStyle(
                                          fontSize:
                                              20, // Adjust the font size as needed
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    const Text(
                                      'Or continue with',
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FloatingActionButton(
                                          onPressed: () {},
                                          child: Image.asset("flogo.png"),
                                        ),
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        FloatingActionButton(
                                          onPressed: () {},
                                          child: Image.asset("glogo.png"),
                                        ),
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        FloatingActionButton(
                                          onPressed: () {},
                                          child: Image.asset("mlogo.png"),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 60),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Not a member yet?"),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              fontSize:
                                                  16, // Adjust the font size as needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ))),
                      ),
                    ]),

                    // Picture ,Column
                    Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/login.png",
                        fit: BoxFit.fill,
                        height: 800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
