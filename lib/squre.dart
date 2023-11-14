import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySqure extends StatelessWidget {
   final String child;

    MySqure({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        height: 300,
        color: Colors.orange,
        child: Center(child: Text(child,style: TextStyle(color: Colors.blue,fontSize: 22),),),
      ),
    );
  }
}
