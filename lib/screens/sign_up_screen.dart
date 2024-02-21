import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/widgets/my_textbox.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = 'signup_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // MyDatePicker(),
            MyTextBox(
              controller: _firstName,
              text: "First name",
            ),
            MyTextBox(
              controller: _lastName,
              text: "Last name",
            ),
            MyTextBox(
              controller: _email,
              text: "Email",
            ),
            MyTextBox(
              controller: _username,
              text: "Username",
            ),
            MyTextBox(
              controller: _password,
              text: "Password",
            ),
            MyTextBox(
              controller: _confirmPassword,
              text: "Confirm Password",
            ),
            MyTextBox(
              controller: _phoneNo,
              text: "Phone No",
            ),
            MyTextBox(
              controller: _address,
              text: "Address",
            ),

            MyTextBox(
              controller: _address,
              text: "Date of Birth",
            ),

            MyTextBox(
              controller: _address,
              text: "Gender",
            ),

            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add sign-up logic here
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
