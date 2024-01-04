import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shop_Page.dart';
import 'package:flutter_application_1/login_form.dart';
import 'package:flutter_application_1/phone_auth.dart';
import 'package:flutter_application_1/splash.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'services/DatabaseService.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _RegistrationScreen();
}

var nameController = TextEditingController();

class _RegistrationScreen extends State<SignUp> {
  User? _user;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var passwordController1 = TextEditingController();
  var emailController = TextEditingController();
  String selectedGender = 'Male'; // Set an initial value
  bool agreedToTerms = false;
  DateTime? selectedDate;
  bool obscureText = true;
  bool obscureText1 = true;

  bool passwordsMatch() {
    return passwordController.text == passwordController1.text;
  }

  String? validatePassword() {
    if (passwordController.text != passwordController1.text) {
      return 'Passwords do not match';
    }
    return null; // Return null if passwords match
  }

  bool allEntriesFilled() {
    return emailController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordController1.text.isNotEmpty;
  }

  String? validatePassword1() {
    if (passwordController.text.length < 6) {
      return 'Password should be at least 6 characters long';
    } else if (passwordController.text != passwordController1.text) {
      return 'Passwords do not match';
    }
    return null; // Return null if passwords match and meet the length criteria
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFF1C2757),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //deletef
              SizedBox(
                height: 100,
              ),
              Container(
                height: 700,
                width: 325,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Please provide your Details',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: nameController,
                        maxLength: 20, // Set maximum length to 15 characters
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          suffixIcon: Icon(
                            FontAwesomeIcons.person,
                            size: 20,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter full name';
                          } else if (value.length > 20) {
                            return 'Name cannot exceed 20 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: Icon(
                              obscureText
                                  ? FontAwesomeIcons.eyeSlash
                                  : FontAwesomeIcons.eye,
                              size: 17,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          } else if (value.length < 6) {
                            return 'Password should be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: passwordController1,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: obscureText1,
                        decoration: InputDecoration(
                          labelText: 'Repeat Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText1 = !obscureText1;
                              });
                            },
                            child: Icon(
                              obscureText1
                                  ? FontAwesomeIcons.eyeSlash
                                  : FontAwesomeIcons.eye,
                              size: 17,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Repeat password';
                          } else if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    if (passwordController.text.isNotEmpty &&
                        passwordController1.text.isNotEmpty &&
                        passwordController.text != passwordController1.text)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Passwords do not match',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    Container(
                      width: 250,
                      child: DropdownButtonFormField<String>(
                        value: selectedGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          suffixIcon: Icon(
                            FontAwesomeIcons.venusMars,
                            size: 17,
                          ),
                        ),
                        items: <String>['Male', 'Female', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Row(
                      children: [
                        Checkbox(
                          value: agreedToTerms,
                          onChanged: (value) {
                            setState(() {
                              agreedToTerms = value!;
                            });
                          },
                        ),
                        const Text(
                          'I agree to all Terms and Conditions',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate() &&
                            agreedToTerms) {
                          _user = await DatabaseService().signUpUser(
                              emailController.text, passwordController.text);

                          print("Button clicked");
                          if (_user != null) {
                            userID = emailController.text;
                            print("User successfully signed Up");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InitialAnimationScreen1(),
                              ),
                            );
                          }
                        } else {
                          // If the form is not valid or terms are not agreed upon
                          if (!allEntriesFilled()) {
                            // Show a dialog if not all fields are filled
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Fill out all values'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the RegistrationScreen when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginForm()),
                        );
                      },
                      child: Text(
                        "Already have an account? Log In Now!!",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
