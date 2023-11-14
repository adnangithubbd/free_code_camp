import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double vals = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Result is ${vals.toInt()}',
            style: TextStyle(fontSize: 22),
          ),
          Slider(
              min: 0,
              max: 100,
              divisions: 100,
              label: '${vals.toInt()}',
              activeColor: Colors.green,
              inactiveColor: Colors.pink,
              value: vals,
              onChanged: (value) {
                setState(() {
                  vals = value;
                });
              }),
        ],
      ),
    );
  }
}
