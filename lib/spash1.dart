import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_form.dart'; // Replace with your actual LoginForm file
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 9), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginForm(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFF1C2757), // Set your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 70,
                left: 0,
                right: 130,
              ),
              child: Container(
                width: 200, // Set width of the container
                height: 200, // Set height of the container
                child: Lottie.asset(
                  'assets/splash.json', // Replace with your animation JSON file path
                  width: double.infinity, // Occupy the available width
                  height: double.infinity, // Occupy the available height
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
            ),
            SizedBox(height: 20), // Space between Lottie and text
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'S H A P E S H I F T',
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Colors.white,
                    Colors.blue,
                    Colors.green,
                    Colors.red,
                  ],
                ),
                TyperAnimatedText(
                  'S H A P E S H I F T',
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Change the color as needed
                  ),
                  speed: Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount:
                  4, // Optional: Specify the number of times to repeat the animation
            ),
          ],
        ),
      ),
    );
  }
}
