import 'package:flutter/material.dart';

class BingoGridScreen extends StatefulWidget {
  @override
  _BingoGridScreenState createState() => _BingoGridScreenState();
}

class _BingoGridScreenState extends State<BingoGridScreen> {
  List<String> challenges = [
    '10 push-ups',
    '30 seconds plank',
    '20 jumping jacks',
    '20 push-ups',
    '30 push-ups',
    '40 push-ups',
    '50 push-ups',
    '60 push-ups',
    '70 push-ups',
    '80 push-ups',
    '90 push-ups',
    '110 push-ups',
    'Free Space',
    '120 push-ups',
    '130 push-ups',
    '140 push-ups',
    '150 push-ups',
    '160 push-ups',
    '170 push-ups',
    '180 push-ups',
    '190 push-ups',
    '121 push-ups',
    '123 push-ups',
    '145 push-ups',
    '116 push-ups',
  ];

  List<bool> isChecked = List.filled(25, false);
  List<int> completedRows = [];

  void checkForBingo() {
    List<int> rowsToCheck = [0, 1, 2, 3, 4]; // Indexes for rows to check
    List<int> columnsToCheck = [0, 1, 2, 3, 4]; // Indexes for columns to check
    bool diagonal1 =
        true; // Tracks diagonal completion (top-left to bottom-right)
    bool diagonal2 =
        true; // Tracks diagonal completion (top-right to bottom-left)

    // Check rows, columns, and diagonals
    for (int i = 0; i < 5; i++) {
      int rowStart = i * 5;

      // Check rows
      if (isChecked[rowStart] &&
          isChecked[rowStart + 1] &&
          isChecked[rowStart + 2] &&
          isChecked[rowStart + 3] &&
          isChecked[rowStart + 4] &&
          !completedRows.contains(i)) {
        setState(() {
          completedRows.add(i);
          _showBingoDialog();
        });
        return;
      } else {
        rowsToCheck.remove(i); // Remove already checked rows
      }

      // Check columns
      if (isChecked[i] &&
          isChecked[i + 5] &&
          isChecked[i + 10] &&
          isChecked[i + 15] &&
          isChecked[i + 20] &&
          !completedRows.contains(i)) {
        setState(() {
          completedRows.add(i);
          _showBingoDialog();
        });
        return;
      } else {
        columnsToCheck.remove(i); // Remove already checked columns
      }

      // Check diagonal from top-left to bottom-right
      if (!isChecked[i * 5 + i]) {
        diagonal1 = false;
      }

      // Check diagonal from top-right to bottom-left
      if (!isChecked[(i + 1) * 4 - 1]) {
        diagonal2 = false;
      }
    }

    // Check completed diagonals
    if (diagonal1 || diagonal2) {
      _showBingoDialog();
      return;
    }

    // Remove completed rows from the list of rows to check
    for (int row in completedRows) {
      rowsToCheck.remove(row);
    }

    // Clear completed rows if all challenges are unchecked in a completed row
    for (int row in rowsToCheck) {
      int rowStart = row * 5;
      if (!isChecked[rowStart] &&
          !isChecked[rowStart + 1] &&
          !isChecked[rowStart + 2] &&
          !isChecked[rowStart + 3] &&
          !isChecked[rowStart + 4] &&
          completedRows.contains(row)) {
        setState(() {
          completedRows.remove(row);
        });
      }
    }
    // ... (Your existing checkForBingo logic)
  }

  void _showBingoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('HURRAY!! BINGO!'),
          content: Text('You have completed a row, column, or diagonal!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
    // ... (Your existing dialog logic)
  }

  void refreshGrid() {
    setState(() {
      // Shuffle the challenges list
      challenges.shuffle();
      isChecked = List.filled(25, false);
      completedRows.clear();
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
                    'Fitness Bingo',
                    style: TextStyle(fontSize: 32.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '🎉 Welcome to the ultimate Bingo extravaganza! 🌟 Get ready for non-stop fun and excitement with our thrilling Bingo game! 🎱🎉. 🏆 Will you be the first to shout "Bingo!" and claim victory? Or will luck favor someone else?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20, // Reduce the height here for less gap
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: challenges.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked[index] = !isChecked[index];
                          checkForBingo();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isChecked[index]
                              ? Colors.blue
                              : Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(8.0),
                          border: completedRows.contains(index ~/ 5)
                              ? Border.all(color: Colors.green, width: 3)
                              : null,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                challenges[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add functionality to refresh data
                refreshGrid();
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: 0,
                    bottom: 80), // Adjust the margin to uplift the button more
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
      ),
    );
  }
}
