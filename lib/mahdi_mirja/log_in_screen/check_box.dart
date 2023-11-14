import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({Key? key}) : super(key: key);

  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  List<Map<String, dynamic>> checkItems = [
    {"id": 0, 'value': false, "title": 'sunday'},
    {"id": 1, 'value': false, "title": 'monday'},
    {"id": 2, 'value': false, "title": 'tuesday'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: 12,
        ),
        Column(
          children: List.generate(
            checkItems.length,
            (index) => CheckboxListTile(
              title: Text(
                checkItems[index]['title'],
                style: TextStyle(color: Colors.brown),
              ),
              subtitle: Text(
                'Id is ${checkItems[index]['id'].toString()}',
                style: TextStyle(color: Colors.yellow),
              ),
              value: checkItems[index]['value'],
              onChanged: (value) {
                setState(() {
                  checkItems[index]['value'] = value;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          getSelectedItems(),
          style: const TextStyle(
            color: Colors.pinkAccent,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String getSelectedItems() {
    List<String> selectedTitles = checkItems
        .where((item) => item['value'] == true)
        .map((item) => item['title'].toString())
        .toList();

    return selectedTitles.isNotEmpty
        ? selectedTitles.join(", ")
        : "No selection";
  }
}
