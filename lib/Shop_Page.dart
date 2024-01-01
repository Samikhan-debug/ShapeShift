import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Calculator.dart';

import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Progress.dart';
import 'package:flutter_application_1/Settings.dart';

import 'package:flutter_application_1/Timer.dart';
import 'package:flutter_application_1/Tip.dart';
import 'package:flutter_application_1/Water.dart';
import 'package:flutter_application_1/Workout_builder.dart';
import 'package:flutter_application_1/alarm.dart';
import 'package:flutter_application_1/counter.dart';
import 'package:flutter_application_1/game.dart';
import 'package:flutter_application_1/homescreen.dart';
import 'package:flutter_application_1/login_form.dart';
import 'package:flutter_application_1/model/UserModel.dart';

import 'package:flutter_application_1/schedule.dart';
import 'package:flutter_application_1/services/DatabaseService.dart';
import 'package:flutter_application_1/workout/workoutprogress.dart';
import 'package:flutter_application_1/workoutscreen.dart';

class Shop_Page extends StatefulWidget {
  const Shop_Page({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<Shop_Page> {
  final List<String> imgList = [
    'assets/watch.jpg',
    'assets/tick.png',
    'assets/run.jpg',
    // Add your image paths here
  ];

  String? name, gender;
  int? height, weight;

  DatabaseService _databaseService = DatabaseService();

  @override
  void initState() {
    // TODO: implement initState
    fetchUserInfo();
    super.initState();
  }

  void fetchUserInfo() {
    _databaseService.getUserInfo(userID).listen((snapshot) {
      setState(() {
        for (var doc in snapshot.docs) {
          UserModelDB userModelDB = doc.data();

          // Assign retrieved data to your variables
          setState(() {
            name = userModelDB.name;
            gender = userModelDB.gender;
            weight = userModelDB.weight;
            height = userModelDB.height;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue,
        color: const Color(0xFF1C2757),
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shop_Page()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GameScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountScreen()),
              );
              break;
          }
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              width: double.infinity,
              color: Color(0xFF1C2757),
              child: Text.rich(
                TextSpan(
                  text: 'Welcome back, ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$name!',
                      style: TextStyle(
                        fontSize: 22.0,
                        color:
                            Colors.blue, // Change the color for the name here
                      ),
                    ),
                    TextSpan(
                      text: '\nTime to level up your fitness game!',
                      style: TextStyle(
                        fontSize: 19.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
                items: [
                  Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: const DecorationImage(
                              image: AssetImage("assets/27.jpg"),
                              fit: BoxFit.cover
                              // image: NetworkImage("https://media.istockphoto.com/id/1409298953/photo/real-estate-agents-shake-hands-after-the-signing-of-the-contract-agreement-is-complete.jpg?s=1024x1024&w=is&k=20&c=Q7y-IUDhsXhiKKDPopD1ZRHRvkeunhledaJ2iMRdEr8="))
                              ),
                          borderRadius: BorderRadius.circular(25))),
                  Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: const DecorationImage(
                              image: AssetImage("assets/33.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(25))),
                  Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: const DecorationImage(
                              image: AssetImage("assets/29.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(25))),
                  Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: const DecorationImage(
                              image: AssetImage("assets/35.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(25))),
                  Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: const DecorationImage(
                              image: AssetImage("assets/37.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(25))),
                ],
                options: CarouselOptions(
                    height: 180,
                    aspectRatio: 16 / 8,
                    viewportFraction: 0.8,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.5)),
            FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Essentials",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 118,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeCategory1(
                                image: 'assets/11.png',
                                title: 'BMI Calculator',
                                tag: 'bmi'),
                            makeCategory12(
                                image: 'assets/44.png',
                                title: 'Calories Checker',
                                tag: 'cc'),
                            makeCategory13(
                                image: 'assets/45.jpg',
                                title: 'Workout Checker',
                                tag: 'wc'),
                            makeCategory14(
                                image: 'assets/45.jpg',
                                title: 'Workout Programs',
                                tag: 'wc1'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Wellness Toolbox",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 118,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeCategory5(
                                image: 'assets/12.jpg',
                                title: 'Water Plan',
                                tag: 'water'),
                            makeCategory6(
                                image: 'assets/13.png',
                                title: 'Camera',
                                tag: 'camera'),
                            makeCategory10(
                                image: 'assets/50.jpg',
                                title: 'Workout Builder',
                                tag: 'builder'),
                            makeCategory11(
                                image: 'assets/14.png',
                                title: 'FitFunFlex',
                                tag: 'fun'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Time Management",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 118,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeCategory9(
                                image: 'assets/15.png',
                                title: 'Alarms',
                                tag: 'alarm'),
                            makeCategory4(
                                image: 'assets/16.png',
                                title: 'Schedule',
                                tag: 'calender'),
                            makeCategory2(
                                image: 'assets/17.png',
                                title: 'Stopwatch',
                                tag: 'stopwatch'),
                            makeCategory3(
                                image: 'assets/18.png',
                                title: 'Timer',
                                tag: 'timer'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Configuration Corner",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 118,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeCategory7(
                                image: 'assets/19.png',
                                title: 'Settings',
                                tag: 'setting'),
                            makeCategory8(
                                image: 'assets/20.png',
                                title: 'FAQs',
                                tag: 'questions'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget makeCategory1({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BMICalculatorScreen()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory2({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeApp()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory3({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CountdownPage()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory9({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Alarm()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory8({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FAQScreen()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory7({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountScreen()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory4({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScheduleView()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory5({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WaterApp()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory6({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PhotoProgressView()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory10({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExerciseScreen()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory11({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            // Navigate to the RegistrationScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameScreen()),
            );
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory12({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory13({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Workoutscreen()));
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory14({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Workoutscreen1()));
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ])),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
