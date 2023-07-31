import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: SignUpForm(
          usernameController: _usernameController,
          emailController: _emailController,
          passwordController: _passwordController,
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignUpForm({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: widget.usernameController,
            decoration: InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
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
                _performSignUp();
                // After successful sign-up, navigate to the login page
                Navigator.pushNamed(context, '/login');
              }
            },
            child: Text('Sign Up'),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              // Navigate to the login screen when the "Already have an account? Log in" button is pressed.
              Navigator.pushNamed(context, '/login');
            },
            child: Text('Already have an account? Log in'),
          ),
        ],
      ),
    );
  }

  void _performSignUp() {
    // Perform sign-up logic here
    String username = widget.usernameController.text;
    String email = widget.emailController.text;
    String password = widget.passwordController.text;

    // Implement your sign-up logic, such as calling an API or saving the data.
    // For demonstration purposes, we'll just show a toast message.
    _showToast("Sign up successful! Welcome, $username!");
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
