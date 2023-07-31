import 'package:flutter/material.dart';
import 'package:flutter_slides/login.dart';
import 'package:flutter_slides/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up and Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/signup', // Set the initial route to the sign-up screen
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
