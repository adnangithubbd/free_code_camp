import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_code_camp/koko/gridview_demo.dart';

import 'clip_rect.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectdIndex = 0;

  _navBar(int index) {
    setState(() {
      _selectdIndex = index;
    });

    print(_selectdIndex);
  }

  final List<Widget> widgets = [
    ClipRected(text: 'first window'),
    ClipRected(
      text: 'Second window',
    ),
    ClipRected(
      text: 'Third window',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('appbar @')),
      body: Center(child: widgets[_selectdIndex]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text('Some one .. !'),
              ),
            ),
            ListTile(
              title: Text('Tile one'),
              leading: Icon(Icons.receipt_long),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Tile one'),
              leading: Icon(Icons.receipt_long),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Tile one'),
              leading: Icon(Icons.menu),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectdIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_work), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_available), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app), label: 'another'),
        ],
        onTap: _navBar,
      ),
    );
  }
}
