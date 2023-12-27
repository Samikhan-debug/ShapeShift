import 'package:flutter/material.dart';

class MemoryMatchGame extends StatefulWidget {
  @override
  _MemoryMatchGameState createState() => _MemoryMatchGameState();
}

class _MemoryMatchGameState extends State<MemoryMatchGame> {
  List<String> exercises = [
    'Jumping Jacks',
    'Push-ups',
    'Squats',
    'Plank',
    'High Knees',
    'Burpees',
    'Lunges',
    'Mountain Climbers',
    // Add more exercises here
  ];

  List<String> exercisePairs = []; // Contains pairs of exercises for the game
  List<int> flippedExercises = []; // Contains flipped card indices

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    List<String> allExercises = [...exercises, ...exercises];
    allExercises.shuffle();
    setState(() {
      exercisePairs = allExercises;
      flippedExercises = [];
    });
  }

  void onCardTap(int index) {
    if (!flippedExercises.contains(index) &&
        flippedExercises.length < 2 &&
        exercisePairs[index] != '') {
      setState(() {
        flippedExercises.add(index);
      });

      if (flippedExercises.length == 2) {
        Future.delayed(Duration(seconds: 1), () {
          checkForMatch();
        });
      }
    }
  }

  void checkForMatch() {
    if (exercisePairs[flippedExercises[0]] ==
        exercisePairs[flippedExercises[1]]) {
      // Match found
      setState(() {
        exercisePairs[flippedExercises[0]] = '';
        exercisePairs[flippedExercises[1]] = '';
        flippedExercises.clear();
      });
      showCongratulatoryMessage();
    } else {
      // No match, flip back the cards
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          flippedExercises = [];
        });
      });
    }
  }

  void showCongratulatoryMessage() {
    // Show a dialog or a snackbar congratulating the user for matching
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Congratulations!'),
        content: Text('You matched the exercises!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2757),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Memory Game',
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '🧠 Get ready to put your memory to the test with our captivating Memory Game!\n🌟 Flip, match, and remember! \n🏆 Will you be the Memory Master? It\'s time to find out! Let the matching madness begin! 🌈✨🃏',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: exercisePairs.length,
              itemBuilder: (BuildContext context, int index) {
                bool isMatched = exercisePairs[index] == '';
                bool isFlipped = flippedExercises.contains(index);
                return GestureDetector(
                  onTap: () {
                    onCardTap(index);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    color: isFlipped || isMatched ? Colors.blue : Colors.grey,
                    child: Center(
                      child: isFlipped || isMatched
                          ? Text(
                              exercisePairs[index],
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            )
                          : Icon(
                              Icons.help_outline,
                              size: 50.0,
                              color: Colors.white,
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              // Add functionality to refresh data
              startGame();
            },
            child: Container(
              margin: EdgeInsets.only(
                  bottom: 40), // Adjust the margin to uplift the button more
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Center(
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 40, // Keep the icon size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
