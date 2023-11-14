import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefDemo extends StatefulWidget {
  const SharedPrefDemo({Key? key}) : super(key: key);

  @override
  _SharedPrefDemoState createState() => _SharedPrefDemoState();
}

class _SharedPrefDemoState extends State<SharedPrefDemo> {
  int? value;
  bool? isBool;
  // Comment: Initialize items list to avoid null issues
  List<String> items = [];
  double? dvalue;

  // Comment: Changed the method name to better reflect its purpose
  _writeData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    // Comment: Fixed the issue with setting values
    preferences.setInt('value', 12);
    preferences.setBool('isBool', true);
    preferences.setDouble('doublevalue', 12.22);
  }

  _readData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      // Comment: Use 'isBool' instead of 'isBool' to match the key
      value = pref.getInt('value');
      isBool = pref.getBool('isBool');
      items = pref.getStringList('items') ?? []; // Comment: Initialize items to avoid null issues
      dvalue = pref.getDouble('doublevalue');
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 220),
          // Comment: Use ElevatedButton instead of TextButton for better visibility
          ElevatedButton(
            onPressed: () {
              setState(() {
                _writeData();
              });
            },
            child: Icon(Icons.done),
          ),
          // Comment: Fixed the Text widget to properly display the list items
          Text('value : $value \n isBool $isBool\n items ${items.join(", ")}\n double value $dvalue'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud_upload_outlined),
        onPressed: () {
          setState(() {
            _readData();
          });
        },
      ),
    );
  }
}