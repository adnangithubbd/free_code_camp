import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
              // Background
              child: Center(
                child: Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              color: Colors.blueAccent,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
            ),

            Container(
                color: Colors.transparent,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('some text'),
                  ],)
            ), // Required some widget in between to float AppBar

            Positioned(
              // To take AppBar Size only
              top: 100.0,
              left: 20.0,
              right: 20.0,
              child: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.yellow,
                  ),
                  onPressed: () {

                  },
                ),
                primary: false,
                title: const TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey))),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.blue),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.blue),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
        //////////

      ],

    );
  }
}
