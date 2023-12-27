import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  DateTime nowTime = DateTime.now();
  DateTime targetDate = DateTime.now();
  Map<DateTime, String> notesMap = {};
  TextEditingController noteController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  void _showAddTaskDialog(DateTime date) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a Task',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                controller: noteController,
                decoration: const InputDecoration(labelText: 'Note'),
                minLines: 3,
                maxLines: 5,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  final taskTitle = titleController.text;
                  final taskNote = noteController.text;
                  final taskDateTime = DateTime(
                    date.year,
                    date.month,
                    date.day,
                  );
                  final existingNote = notesMap[taskDateTime];
                  if (existingNote != null && existingNote.isNotEmpty) {
                    notesMap[taskDateTime] =
                        '$existingNote\n- $taskTitle: $taskNote';
                  } else {
                    notesMap[taskDateTime] = '- $taskTitle: $taskNote';
                  }
                  titleController.clear();
                  noteController.clear();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2757),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.MMMM().format(targetDate).toUpperCase(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          DateFormat.y().format(targetDate),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        targetDate =
                            DateTime(targetDate.year, targetDate.month - 1);
                      });
                    },
                    icon: Image.asset(
                      "assets/back.png",
                      width: 15,
                      height: 15,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        targetDate =
                            DateTime(targetDate.year, targetDate.month + 1);
                      });
                    },
                    icon: Image.asset(
                      "assets/front.jpg",
                      width: 15,
                      height: 15,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Stack(
                children: [
                  CalendarCarousel(
                    todayButtonColor: Colors.blue,
                    todayBorderColor: Colors.blue,
                    selectedDayButtonColor: Colors.blue,
                    selectedDayBorderColor: Colors.blue,
                    onDayPressed: (DateTime date, List<dynamic> events) {
                      setState(() {
                        targetDate = date;
                        noteController.text = notesMap[date] ?? '';
                      });
                    },
                    selectedDayTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    daysTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    weekDayFormat: WeekdayFormat.narrow,
                    weekdayTextStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                    weekendTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    thisMonthDayBorderColor: Colors.transparent,
                    showHeader: false,
                    weekFormat: false,
                    height: 340.0,
                    selectedDateTime: nowTime,
                    targetDateTime: targetDate,
                    daysHaveCircularBorder: true,
                    customDayBuilder: (
                      bool isSelectable,
                      int index,
                      bool isSelectedDay,
                      bool isToday,
                      bool isPrevMonthDay,
                      TextStyle textStyle,
                      bool isNextMonthDay,
                      bool isThisMonthDay,
                      DateTime day,
                    ) {
                      if (notesMap.containsKey(day)) {
                        return Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            day.day.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 33),
                    child: Divider(
                      color: Colors.white24,
                      height: 1,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: notesMap.length,
                    itemBuilder: (context, index) {
                      final date = notesMap.keys.elementAt(index);
                      final note = notesMap.values.elementAt(index);

                      return Container(
                        padding: const EdgeInsets.only(bottom: 15, left: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                date.day.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                note,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _showAddTaskDialog(targetDate);
                    },
                    child: const Text('Add a Task'),
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
