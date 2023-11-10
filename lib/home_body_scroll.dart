import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'carosole_slide.dart';
import 'home_screen.dart';

class Home_body_scroll extends StatefulWidget {
  const Home_body_scroll({super.key});

  @override
  State<Home_body_scroll> createState() => _Home_body_scrollState();
}

class _Home_body_scrollState extends State<Home_body_scroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Evaly'),
      backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.menu), onPressed: () {

        },
        ),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.settings)),
        ],
      ),

      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Carosole(),
              ),

              IcnBtn(),
              Container(
                height: 800,
                width: MediaQuery.of(context).size.width,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.black),
                child: Column(
                  children: [
                    Carosole2(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
