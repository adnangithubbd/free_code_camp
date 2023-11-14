import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({super.key});

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime _dateTime = DateTime.now();

  _showCal() {
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate:DateTime(2025)).then((value) {
          setState(() {
            _dateTime=value!;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$_dateTime \n now !'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                  onPressed: _showCal,
                  child: const Icon(Icons.calendar_today_sharp))
            ],
          )


        ],),
    );
  }
}
