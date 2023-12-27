import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class SleepData {
  final DateTime date;
  final int sleepHours;

  SleepData(this.date, this.sleepHours);
}

class SleepEntryScreen extends StatefulWidget {
  @override
  _SleepEntryScreenState createState() => _SleepEntryScreenState();
}

class _SleepEntryScreenState extends State<SleepEntryScreen> {
  TimeOfDay? _bedtime;
  TimeOfDay? _wakeUpTime;
  DateTime? _selectedDate;
  String _sleepDuration = '';
  List<SleepData> _sleepData = [];

  Future<void> _selectTime(BuildContext context, bool isBedtime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && mounted) {
      setState(() {
        if (isBedtime) {
          _bedtime = picked;
        } else {
          _wakeUpTime = picked;
        }
        _calculateSleepDuration();
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );
    if (picked != null && mounted) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _calculateSleepDuration() {
    if (_bedtime != null && _wakeUpTime != null && _selectedDate != null) {
      final DateTime sleepDate = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _bedtime!.hour > _wakeUpTime!.hour
            ? _selectedDate!.day + 1
            : _selectedDate!.day,
        _bedtime!.hour,
        _bedtime!.minute,
      );
      final DateTime wakeUpDate = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _wakeUpTime!.hour,
        _wakeUpTime!.minute,
      );
      final Duration duration = wakeUpDate.difference(sleepDate);
      final int sleepHours = duration.inHours;
      _sleepDuration = '$sleepHours hours';
      _sleepData.add(SleepData(_selectedDate!, sleepHours));
    } else {
      _sleepDuration = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Sleep Schedule'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                _selectedDate == null
                    ? 'Select Date'
                    : 'Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _selectTime(context, true),
              child: Text(
                _bedtime == null
                    ? 'Select Bedtime'
                    : 'Bedtime: ${_bedtime!.format(context)}',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _selectTime(context, false),
              child: Text(
                _wakeUpTime == null
                    ? 'Select Wake-up Time'
                    : 'Wake-up Time: ${_wakeUpTime!.format(context)}',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _calculateSleepDuration();
                _showSleepChart();
              },
              child: Text('Calculate Sleep Duration'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Sleep Duration: $_sleepDuration',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: _sleepData.isNotEmpty
                  ? charts.BarChart(
                      [
                        charts.Series<SleepData, String>(
                          id: 'Sleep',
                          colorFn: (_, __) =>
                              charts.MaterialPalette.blue.shadeDefault,
                          domainFn: (SleepData sleepData, _) =>
                              DateFormat('yyyy-MM-dd').format(sleepData.date),
                          measureFn: (SleepData sleepData, _) =>
                              sleepData.sleepHours,
                          data: _sleepData,
                        ),
                      ],
                      animate: true,
                      vertical: false, // Flips the orientation
                      barRendererDecorator: charts.BarLabelDecorator<String>(),
                      domainAxis: charts.OrdinalAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec(
                          // Adjusts the bar thickness
                          labelStyle: charts.TextStyleSpec(
                            fontSize: 12, // Reduces label font size
                            color: charts.MaterialPalette.black,
                          ),
                        ),
                      ),
                    )
                  : Center(child: Text('No data available to display.')),
            ),
          ],
        ),
      ),
    );
  }

  void _showSleepChart() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text('Sleep Hours Chart')),
        body: Center(
          child: _sleepData.isNotEmpty
              ? charts.BarChart(
                  [
                    charts.Series<SleepData, String>(
                      id: 'Sleep',
                      colorFn: (_, __) =>
                          charts.MaterialPalette.blue.shadeDefault,
                      domainFn: (SleepData sleepData, _) =>
                          DateFormat('yyyy-MM-dd').format(sleepData.date),
                      measureFn: (SleepData sleepData, _) =>
                          sleepData.sleepHours,
                      data: _sleepData,
                    ),
                  ],
                  animate: true,
                  vertical: false,
                )
              : Text('No data available to display.'),
        ),
      ),
    ));
  }
}
