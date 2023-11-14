import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestureDemo extends StatefulWidget {
  const GestureDemo({super.key});

  @override
  State<GestureDemo> createState() => _GestureDemoState();
}

class _GestureDemoState extends State<GestureDemo> {
  int count=0;

  _counter(){
   setState(() {
     count++;
   });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _counter,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Counter ::  $count itemsdd'),
            ],
          ),
        ),
      ),
    );
  }
}
