import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipRected extends StatelessWidget {
  final String text;

  ClipRected({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22), color: Colors.blue),
          height: 100,
          width: 100,
          child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                text,
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
}
