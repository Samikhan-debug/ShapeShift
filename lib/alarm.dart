import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  DateTime now = DateTime.now();
  Timer? _everySec;
  List<AlarmItem> alarms = []; // Store alarms in a list for display

  Future<DateTime> fetchClock() async {
    now = DateTime.now();
    return now;
  }

  @override
  void initState() {
    super.initState();

    _everySec = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });

    // Sample data for alarms (remove this if not needed)
  }

  void _addAlarm() async {
    // Show dialog to set alarm day and time
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      DateTime? selectedDay = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
      );

      if (selectedDay != null) {
        // Add the selected alarm day and time to the list
        setState(() {
          final formattedDay = DateFormat('d MMMM, EEEE')
              .format(selectedDay); // Updated date format
          alarms.add(
            AlarmItem(time: selectedTime, day: formattedDay, isActive: true),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2757),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimerBuilder.periodic(
                Duration(seconds: 1),
                builder: (context) {
                  //getting the time
                  String second = DateTime.now().second < 10
                      ? "0${DateTime.now().second}"
                      : DateTime.now().second.toString();
                  String minute = DateTime.now().minute < 10
                      ? "0${DateTime.now().minute}"
                      : DateTime.now().minute.toString();
                  String hour = DateTime.now().hour < 10
                      ? "0${DateTime.now().hour}"
                      : DateTime.now().hour.toString();
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today",
                            style: AppStyle.mainTextThin.copyWith(
                                color: Colors
                                    .white), // Adjusting text color to blue
                          ),
                          Text(
                            "$hour:$minute",
                            style: AppStyle.maintext.copyWith(
                                color: Colors
                                    .white), // Adjusting text color to blue
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      ClockView(DataTime(DateTime.now().hour,
                          DateTime.now().minute, DateTime.now().second)),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: alarms.length,
                  itemBuilder: (BuildContext context, int index) {
                    final alarm = alarms[index];

                    return ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${alarm.day} ${alarm.time.format(context)}', // Show day and time
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Switch(
                            value: alarm.isActive,
                            onChanged: (value) {
                              setState(() {
                                alarms[index].isActive = value;
                              });
                            },

                            // Adjusting switch color to white
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                alarms.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAlarm,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AlarmItem {
  final TimeOfDay time;
  final String day; // Add day to the AlarmItem
  bool isActive;

  AlarmItem({required this.time, required this.day, this.isActive = false});
}

class DataTime {
  int? sec;
  int? min;
  int? hour;

  DataTime(this.hour, this.min, this.sec);
}

class AppStyle {
  static Color primaryColor = const Color(0xFF2253FF);
  static Color primaryColorDark = const Color(0xFF193BB1);

  /* Definining text style */
  static TextStyle maintext = const TextStyle(
    color: Colors.black,
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mainTextThin = const TextStyle(
    color: Colors.black,
    fontSize: 32.0,
    fontWeight: FontWeight.normal,
  );
}

class ClockView extends StatefulWidget {
  ClockView(this.time, {Key? key}) : super(key: key);
  DataTime time;
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: AppStyle.primaryColor.withAlpha(80),
          blurRadius: 38.0,
        )
      ]),
      height: 300,
      width: 300,
      child: CustomPaint(
        painter:
            ClockPainter(widget.time.hour, widget.time.min, widget.time.sec),
      ),
    );
  }
}

// creating the Clock Painter Class

class ClockPainter extends CustomPainter {
  int? seconds;
  int? minutes;
  int? hours;
  ClockPainter(this.hours, this.minutes, this.seconds);

  @override
  void paint(Canvas canvas, Size size) {
    //setting the time conversion
    double secRad = ((pi / 2) - (pi / 30) * this.seconds!) % (2 * pi);
    double minRad = ((pi / 2) - (pi / 30) * this.minutes!) % (2 * pi);
    double hourRad = ((pi / 2) - (pi / 6) * this.hours!) % (2 * pi);

    // cetting the Center point coordinates
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    /* Setting the Time coordinates */
    var secHeight = radius / 2;
    var minHeight = radius / 2 - 10;
    var hoursHeight = radius / 2 - 25;

    var seconds = Offset(
        centerX + secHeight * cos(secRad), centerY - secHeight * sin(secRad));
    var minutes = Offset(
        centerX + cos(minRad) * minHeight, centerY - sin(minRad) * minHeight);
    var hours = Offset(centerX + cos(hourRad) * hoursHeight,
        centerY - sin(hourRad) * hoursHeight);

    // Setting the Fillbrush paint
    var fillBrush = Paint()
      ..color = AppStyle.primaryColor
      ..strokeCap = StrokeCap.round;

    /*  var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16; */

    var centerDotBrush = Paint()..color = Color(0xFFEAECFF);

    /* Setting the hands brush */

    var secHandBrush = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;

    var minHandBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round;

    var hourHandBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..strokeJoin = StrokeJoin.round;

    canvas.drawCircle(center, radius - 40, fillBrush);
    // canvas.drawCircle(center, radius - 40, outlineBrush);

    // drawing the sec hand
    canvas.drawLine(center, seconds, secHandBrush);
    canvas.drawLine(center, minutes, minHandBrush);
    canvas.drawLine(center, hours, hourHandBrush);

    canvas.drawCircle(center, 16, centerDotBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
