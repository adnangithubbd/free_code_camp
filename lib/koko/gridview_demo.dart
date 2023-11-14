import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridDemo extends StatelessWidget {
  const GridDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var dw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GridView.count(children: [
        Box(),
        Box(),
        Box(),
        Box(),

      ], crossAxisCount: dw>12233?3:2),
    );
  }
}

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ClipRRect(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
