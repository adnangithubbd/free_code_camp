import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  String child;
    Story({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.pink,
        ),
        child: Center(child: Text(child),),
      ),
    );
  }
}
