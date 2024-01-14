import 'package:flutter/material.dart';
import 'package:flutter_application_1/phone_auth.dart';

import 'package:flutter_application_1/spash1.dart';
import 'package:lottie/lottie.dart';

class InitialAnimationScreen extends StatefulWidget {
  @override
  _InitialAnimationScreenState createState() => _InitialAnimationScreenState();
}

class _InitialAnimationScreenState extends State<InitialAnimationScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen(); // Function to navigate to the SplashScreen after a delay
  }

  // Delay for initial animation, then navigate to the SplashScreen
  void _navigateToNextScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1C2757), // Set your desired background color
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 70,
              left: 0,
              right: 100,
            ),
            child: Container(
              width: 300, // Set width of the container
              height: 400, // Set height of the container
              child: Lottie.asset(
                'assets/splash4.json', // Replace with your animation JSON file path
                width: double.infinity, // Occupy the available width
                height: double.infinity, // Occupy the available height
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ),
        ])));
  }
}

class InitialAnimationScreen1 extends StatefulWidget {
  @override
  _InitialAnimationScreenState1 createState() =>
      _InitialAnimationScreenState1();
}

class _InitialAnimationScreenState1 extends State<InitialAnimationScreen1> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen(); // Function to navigate to the SplashScreen after a delay
  }

  // Delay for initial animation, then navigate to the SplashScreen
  void _navigateToNextScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => PhoneAuth(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1C2757), // Set your desired background color
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 70,
              left: 0,
              right: 100,
            ),
            child: Container(
              width: 300, // Set width of the container
              height: 400, // Set height of the container
              child: Lottie.asset(
                'assets/splash8.json', // Replace with your animation JSON file path
                width: double.infinity, // Occupy the available width
                height: double.infinity, // Occupy the available height
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ),
        ])));
  }
}
