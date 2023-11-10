import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_code_camp/profile.dart';

class TabBarDemo1 extends StatelessWidget {
    TabBarDemo1({super.key});
    List<Widget> screen=[FirstScreen(),SecondScreen(),ThirdScreen()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom:   TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home),),
                  Tab(icon: Icon(Icons.location_city),),
                  Tab(icon: Icon(Icons.villa),),
                ],
              ),
            ),
            body:   TabBarView(children: [
            screen[0],
             screen[1],
            screen[2],

            ]),
          ),
        ),

    );
  }
}


