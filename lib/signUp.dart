import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_form.dart';
import 'package:flutter_application_1/new.dart';
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
                height: 650,
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
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          suffixIcon: Icon(
                            FontAwesomeIcons.envelope,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          suffixIcon: Icon(
                            FontAwesomeIcons.person,
                            size: 20,
                          ),
                        ),
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
                            print("User succesfully signed Up");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OnboardingScreen(),
                                ));
                          }
                        } else {
                          print("Error Occured");

                          debugPrint("could not login");
                          //  }
                          // } else {
                          //   // Form is not valid or terms are not agreed upon
                          //   debugPrint(
                          //       "Form validation failed or terms not agreed upon");
                          // }
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
