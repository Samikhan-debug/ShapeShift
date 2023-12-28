import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Settings.dart';
import 'package:flutter_application_1/Shop_Page.dart';
import 'package:flutter_application_1/bingo.dart';
import 'package:flutter_application_1/challenge.dart';

import 'package:flutter_application_1/memory.dart';

class GameScreen extends StatelessWidget {
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
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
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
        backgroundColor: const Color(0xFF1C2757),
        body: ListView(children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 28),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Revitalize Your Workout Routine! 💪🌟',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily:
                              'Arial', // Added font family for a modern look
                        ),
                      ),
                      SizedBox(height: 10), // Added space for readability
                      Text(
                        'Tired of mundane workouts and rigid diets? Dive into our latest fitness games!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontStyle: FontStyle.italic, // Adds emphasis
                        ),
                      ),
                      SizedBox(height: 8), // Adjusted spacing
                      Text(
                        'Designed to make fitness fun and invigorating!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Subtle color for emphasis
                        ),
                      ),
                      SizedBox(height: 15), // A bit more space for impact
                      Text(
                        'Discover the joy of sweating it out with a smile!🤸‍♂️🔥',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white, // Draws attention
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20), // Add spacing between text and image
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Stack 1 with game
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Transform(
                            transform: Matrix4.skewY(-0.2),
                            origin: Offset(50.0, 50.0),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              height: 270,
                              width: 170,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(42, 68, 231, 1),
                                    Color.fromRGBO(101, 119, 223, 1),
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100, left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),
                                Text(
                                  'Fitness\nBingo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2, right: 10, top: 5, bottom: 5),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Navigate to BingoGridScreen
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BingoGridScreen(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.blue,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Text(
                                                'Play Now',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 170,
                            left: 20,
                            child: Image(
                              image: AssetImage('assets/bingo.png'),
                              height: 160,
                            ),
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                      SizedBox(width: 20),
                      // Stack 2 with another game
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Transform(
                            transform: Matrix4.skewY(-0.2),
                            origin: Offset(50.0, 50.0),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              height: 270,
                              width: 170,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(42, 68, 231, 1),
                                    Color.fromRGBO(101, 119, 223, 1),
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100, left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),
                                Text(
                                  'Memory\nChallenge',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2, right: 10, top: 5, bottom: 5),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Navigate to MemoryMatchGame
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MemoryMatchGame(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.blue,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Text(
                                                'Play Now',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12)
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 170,
                            left: 20,
                            child: Image(
                              image: AssetImage('assets/41.jpg'),
                              height: 140,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Transform(
                            transform: Matrix4.skewY(-0.2),
                            origin: Offset(50.0, 50.0),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              height: 270,
                              width: 170,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(42, 68, 231, 1), // Dark blue
                                    Color.fromRGBO(
                                        101, 119, 223, 1), // Light blue
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100, left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),
                                Text(
                                  '30 Seconds\nChallenge',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2, right: 10, top: 5, bottom: 5),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Navigate to the RegistrationScreen when the button is pressed
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ExerciseChallenge(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.blue,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Text(
                                                'Play Now',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 170,
                            left: 20,
                            child: Image(
                              image: AssetImage('assets/40.jpg'),
                              height: 140,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}

// Add more game stacks within this Column as needed

const ktext = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.w900,
);
const ksmalltext = TextStyle(
  color: Colors.white,
  fontSize: 15,
);
const klarge = TextStyle(
  color: Colors.white,
  fontSize: 32,
  fontFamily: 'Oswald',
);
