import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Persent_Indicator extends StatefulWidget {
  const Persent_Indicator({super.key});

  @override
  State<Persent_Indicator> createState() => _Persent_IndicatorState();
}

class _Persent_IndicatorState extends State<Persent_Indicator> {
  int counter = 0;
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 10.0,
              percent: counter / 100,
              header: const Text("Icon header"),
              center: isChanged
                  ? const Icon(
                      Icons.person_pin,
                      size: 50.0,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.crop_rounded),
              fillColor: Colors.transparent,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 5.0,
                percent: 1.0,
                center: const Text("100%"),
                progressColor: Colors.green,
              ),
            ),
            IconButton(
                onPressed: () {
                  Timer.periodic(const Duration(seconds: 1), (timer) {
                    setState(() {
                      counter++;
                      if (counter > 10) {
                        isChanged = true;
                      }
                    });
                  });
                },
                icon: Icon(Icons.add)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: 140.0,
                lineHeight: 14.0,
                percent: 0.5,
                center: const Text(
                  "50.0%",
                  style: TextStyle(fontSize: 12.0),
                ),
                trailing: const Icon(Icons.mood),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
