import 'package:flutter/material.dart';

import 'dart:math';

class ExerciseChallenge extends StatefulWidget {
  @override
  _ExerciseChallengeState createState() => _ExerciseChallengeState();
}

class _ExerciseChallengeState extends State<ExerciseChallenge>
    with SingleTickerProviderStateMixin {
  final exercises = [
    '10x Jumping Jacks',
    '5x Push-ups',
    '5x Squats',
    '3x Plank',
    '10x High Knees',
    // Add more exercises here
  ];

  late AnimationController _controller;
  late Animation<int> _animation;
  int _secondsRemaining = 30; // Initial duration for the challenge
  String _currentExercise = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _secondsRemaining),
    );

    _animation = IntTween(
      begin: _secondsRemaining,
      end: 0,
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          _secondsRemaining = _animation.value;
        });
      });

    _generateRandomExercise();
  }

  void _startTimer() {
    _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value);
  }

  void _markChallengeDone() {
    _controller.stop();
  }

  void _refreshChallenge() {
    _controller.stop();
    _controller.reset();
    setState(() {
      _secondsRemaining = 30;
    });
    _generateRandomExercise();
  }

  void _generateRandomExercise() {
    final random = Random();
    final randomIndex = random.nextInt(exercises.length);
    setState(() {
      _currentExercise = exercises[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2757),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '🌟 Ready for a fitness challenge? 🏋️‍♂️ Introducing our exciting new game! 🎉\nHow many exercises can YOU conquer in just 30 seconds? 💪🕒',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey.shade300,
                          value: _secondsRemaining / 30,
                          strokeWidth: 6,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!_controller.isAnimating) {
                            _startTimer();
                          }
                        },
                        child: Text(
                          '$_secondsRemaining',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Perform:',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _currentExercise,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Time Gone: $_secondsRemaining seconds',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed:
                        _secondsRemaining > 0 ? _markChallengeDone : null,
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _refreshChallenge,
                    child: Text(
                      'Refresh',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20), // Extra space at the bottom
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
