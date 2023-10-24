import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Image in Table'),
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
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Card(
                                    elevation: 100,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(50.0),
                                      child: const SignInScreen(),
                                    )),
                              ),
                            ),
                          ]),

                      // Picture ,Column
                      Container(
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/login.png",
                          fit: BoxFit.fill,
                          height: 700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Hello to your English tutors!',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 32),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            // Add your sign in logic here
          },
          child: const Text('LOG IN'),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            // Navigate to sign up screen
          },
          child: const Text('Or continue with Forgot Password?'),
        ),
      ],
    );
  }
}
