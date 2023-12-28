import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/WaterPlan.dart';
import 'package:flutter_application_1/services/DatabaseService.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

class WaterApp extends StatefulWidget {
  const WaterApp({Key? key}) : super(key: key);

  @override
  _WaterAppState createState() => _WaterAppState();
}

class _WaterAppState extends State<WaterApp> {
  DatabaseService _dbService = DatabaseService();
  double percentage = 0.0;
  int filledGlasses = 0;
  List<DateTime> filledTimes = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fillGlass() {
    setState(() {
      if (filledGlasses < 8) {
        filledGlasses++;
        percentage += 12.5;
        if (percentage > 100.0) {
          percentage = 100.0;
        }
        filledTimes.add(DateTime.now());

        WaterDB waterData = WaterDB(
          userID: 'samikhan@gmail.com',
          isClicked: true,
          Date: DateTime.now(),
        );
        _dbService.addUser(waterData);
      }
    });
  }

  void resetGlasses() {
    setState(() {
      filledGlasses = 0;
      percentage = 0.0;
      filledTimes.clear();
      _dbService.deleteAllUserRecords("samikhan@gmail.com");
      print("User Info Deleted");
    });
  }

  Future<void> fetchData() async {
    DateTime today = DateTime.now();
    String userID = 'samikhan@gmail.com';

    _dbService
        .getUserWaterLevel(userID, today)
        .listen((QuerySnapshot<WaterDB> snapshot) {
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          int numberOfEntries = snapshot.docs.length;
          filledGlasses = numberOfEntries > 8 ? 8 : numberOfEntries;
          percentage = filledGlasses * 12.5;
          filledTimes.clear();
          snapshot.docs.forEach((doc) {
            filledTimes.add(doc.data().Date);
          });
        });
      } else {
        setState(() {
          filledGlasses = 0;
          percentage = 0.0;
          filledTimes.clear();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: const Color(0xFF1C2757),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Water Tracking Plan",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 110.0,
                  backgroundImage: AssetImage('assets/drink.jpg'),
                ),
                CircularPercentIndicator(
                  radius: 250.0,
                  lineWidth: 10.0,
                  percent: percentage / 100.0,
                  center: Text(
                    '${percentage.toInt()}%',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressColor: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(8, (index) {
                return Container(
                  margin: EdgeInsets.all(4),
                  width: 30,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    color: index < filledGlasses
                        ? Colors.blue
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.local_drink,
                    color: index < filledGlasses
                        ? Colors.white
                        : Colors.transparent,
                  ),
                );
              }),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    fillGlass();
                  },
                  child: Icon(Icons.wine_bar),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
                ElevatedButton(
                  onPressed: resetGlasses,
                  child: Icon(Icons.refresh),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF323F68),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  itemCount: filledTimes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.local_drink),
                      title: Text(
                        DateFormat.jm().format(filledTimes[index]),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
