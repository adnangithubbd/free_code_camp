import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerDemo extends StatefulWidget {
  const DrawerDemo({super.key});

  @override
  State<DrawerDemo> createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      shadowColor: Colors.yellow,
      elevation: 5.0,
      child: Container(
        child: Column(
          children: [
            DrawerHeader(
                child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/google.png',
                ),
                Positioned(
                    bottom: 0,
                    left: 12,
                    child: Text(
                      'Google',
                      style: GoogleFonts.akshar(
                          textStyle: TextStyle(
                        color: Colors.black,
                      )),
                    ))
              ],
            )),
            ListTile(
              title: Text('Title 1'),
              onTap: () {
                print('Tiltle 1 is clicked');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('title2'),
              onTap: () {
                print('Tiltle 2 is clicked');
              },
            ),
          ],
        ),
      ),
    );
  }
}
