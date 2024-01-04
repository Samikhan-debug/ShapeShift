import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/otp.dart';
import 'package:lottie/lottie.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Phone Auth",
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
            'assets/splash5.json', // Replace with your Lottie file path
            width: 150,
            height: 150,
            // Other properties as needed
          ),
          SizedBox(height: 70),
          Text(
            'OTP Verification',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Enter your phone number to send one-time password',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Container(
                  width: 60,
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: "+92",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                      hintText: "Enter phone Number",
                      errorText: phoneController.text.length != 10 &&
                              phoneController.text.isNotEmpty
                          ? "Please enter a valid phone number"
                          : null,
                      suffixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              if (phoneController.text.length != 10) {
                setState(() {
                  showError = true;
                });
              } else {
                setState(() {
                  showError = false;
                });

                // Move this block inside the else statement
                try {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: "+92${phoneController.text}",
                    verificationCompleted: (PhoneAuthCredential credential) {
                      print("Verification Completed");
                    },
                    verificationFailed: (FirebaseAuthException ex) {
                      print("Verification Failed: $ex");
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(
                            verificationid: verificationId,
                          ),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                      print("Auto Retrieval Timeout");
                    },
                  );
                } catch (ex) {
                  print("Error: $ex");
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
          if (showError)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                phoneController.text.isEmpty
                    ? 'Please fill out the field'
                    : 'Please enter a 10-digit number',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
