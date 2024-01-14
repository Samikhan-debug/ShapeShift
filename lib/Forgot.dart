import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/otp.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: 24, // Adjust the font size here
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Lottie.asset(
            'assets/splash6.json', // Replace with your Lottie file path
            width: 200,
            height: 200,
            // Other properties as needed
          ),
          SizedBox(height: 70),
          Text(
            'Forgot Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Enter your email address to send you your new password.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Centering the form field horizontally
              children: [
                Container(
                  width: 250,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      suffixIcon: Icon(
                        FontAwesomeIcons.envelope,
                        size: 17,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter email address';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (emailController.text.isEmpty ||
                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(emailController.text)) {
                // Show error message for invalid email
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Invalid email address'),
                    duration: Duration(seconds: 2), // Adjust duration as needed
                  ),
                );
                return;
              }

              auth
                  .sendPasswordResetEmail(email: emailController.text)
                  .then((value) {
                // Show success message when email is sent
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Password reset email sent!'),
                    duration: Duration(seconds: 2), // Adjust duration as needed
                  ),
                );
              }).catchError((error) {
                // Show error message if there's an issue sending the email
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error sending password reset email: $error'),
                    duration: Duration(seconds: 3), // Adjust duration as needed
                  ),
                );
              });
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
