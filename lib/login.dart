import 'package:flutter/material.dart';
import 'package:flutter_slides/ServiceHome.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: LoginForm(
          emailController: _emailController,
          passwordController: _passwordController,
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginForm({
    required this.emailController,
    required this.passwordController,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: widget.emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email address';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: widget.passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _performLogin(context);
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  void _performLogin(BuildContext context) {
    // Perform login logic here
    String email = widget.emailController.text;
    String password = widget.passwordController.text;

    // Implement your login logic, such as calling an API for authentication.
    // For demonstration purposes, we'll simulate a login with hardcoded credentials.
    // Replace this with your actual login logic.
    if (email == email && password == password) {
      // Navigate to the Service Home Page after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ServiceHome()),
      );
    } else {
      // Show an error message when login fails
      _showToast("Invalid email or password. Please try again.");
    }
  }

  void _showToast(String message) {
    // This is just a simple toast implementation using the fluttertoast package.
    // Make sure to add the `fluttertoast` package in your `pubspec.yaml`.
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }
}
