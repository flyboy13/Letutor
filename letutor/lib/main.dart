import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SignInScreen(),
          ),
        ),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
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
        Text(
          'Hello to your English tutors!',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 32),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            // Add your sign in logic here
          },
          child: Text('LOG IN'),
        ),
        SizedBox(height: 16),
        TextButton(
          onPressed: () {
            // Navigate to sign up screen
          },
          child: Text('Or continue with Forgot Password?'),
        ),
      ],
    );
  }
}
