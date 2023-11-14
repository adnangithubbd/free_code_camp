import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerDemo extends StatefulWidget {
  const TimePickerDemo({super.key});

  @override
  State<TimePickerDemo> createState() => _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {

  TimeOfDay _timeOfDay=TimeOfDay(hour: TimeOfDay.hoursPerDay, minute: TimeOfDay.minutesPerHour);
  void _showTimePicker() {
    showTimePicker(context: context,
        initialTime: TimeOfDay.now()).then((value) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('Result time is . . . $_timeOfDay'),
        CupertinoButton(child: const Icon(Icons.timelapse_sharp), onPressed: () {
          _showTimePicker();
        })
      ],),)
    );
  }
}
