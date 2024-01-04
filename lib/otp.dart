import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_form.dart';
import 'package:flutter_application_1/new.dart';
import 'package:lottie/lottie.dart';

class OTPScreen extends StatefulWidget {
  final String verificationid;

  OTPScreen({Key? key, required this.verificationid}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Lottie.asset(
            'assets/new.json', // Replace with your Lottie file path
            width: 150,
            height: 150,
            // Other properties as needed
          ),
          SizedBox(height: 70),
          Text(
            'Verification Code',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'We have sent the verification code to your phone number',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter the OTP",
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                errorText: showError ? "Wrong OTP. Try Again!" : null,
              ),
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              if (otpController.text.isEmpty) {
                setState(() {
                  showError = true;
                });
              } else {
                setState(() {
                  showError = false;
                });
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationid,
                    smsCode: otpController.text.toString(),
                  );

                  await FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingScreen(),
                      ),
                    );
                  });
                } catch (ex) {
                  setState(() {
                    showError = true;
                  });
                  log(ex.toString());
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 18),
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
