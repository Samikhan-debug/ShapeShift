import 'package:flutter/material.dart';
import 'package:flutter_application_1/workout/workout_detail.dart';

class WorkoutDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              "At ShapeShift, we understand that everyone's fitness journey is unique, and that's why we've crafted our most popular workout plans to cater to a variety of goals and preferences.",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.2,
                height: 1.5,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.grey.withOpacity(0.7),
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFF1C2757),
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  WorkoutRow(
                    colors: [Colors.red, Colors.orange],
                    title: 'Full Body Workout',
                    difficulty: 'Intermediate',
                    totalTime: '45 mins',
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkoutDetailView(
                                  dObj: {},
                                )),
                      );
                    },
                  ),
                  SizedBox(height: 30.0),
                  WorkoutRow(
                    colors: [Colors.green, Colors.blue],
                    title: 'Cardio Inferno Fusion',
                    difficulty: 'Advanced',
                    totalTime: '60 mins',
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkoutDetailView(
                                  dObj: {},
                                )),
                      );
                    },
                  ),
                  SizedBox(height: 30.0),
                  WorkoutRow(
                    colors: [Colors.purple, Colors.pink],
                    title: 'Power Pulse Marathon',
                    difficulty: 'Beginner',
                    totalTime: '30 mins',
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkoutDetailView(
                                  dObj: {},
                                )),
                      );
                    },
                  ),
                  // Add more WorkoutRow widgets as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutRow extends StatelessWidget {
  final List<Color> colors;
  final String title;
  final String difficulty;
  final String totalTime;
  final VoidCallback onTap;

  WorkoutRow({
    required this.colors,
    required this.title,
    required this.difficulty,
    required this.totalTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.all(16.0),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Text(
                'HIGH',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Difficulty: $difficulty',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Total Time: $totalTime',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
