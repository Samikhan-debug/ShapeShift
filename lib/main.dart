import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Settings.dart';
import 'package:flutter_application_1/firebase_options.dart';

import 'package:flutter_application_1/login_form.dart';
import 'package:flutter_application_1/phone_auth.dart';
import 'package:flutter_application_1/splash.dart';

import 'package:flutter_application_1/workout/workout_detail.dart';
import 'package:flutter_application_1/workout/workoutprogress.dart';
import 'package:flutter_application_1/workoutscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login Form',
        theme: ThemeData(primaryColor: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: InitialAnimationScreen());
  }
}
