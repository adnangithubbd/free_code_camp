import 'package:flutter/material.dart';
import 'package:free_code_camp/home_body_scroll.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionsStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const List<Widget> _widgets = <Widget>[
      Home_body_scroll(),
    Text(
      'Index 1: Business',
      style: optionsStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionsStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home'
          ),
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.baby_changing_station),
              label: 'Business'),
          NavigationDestination(
              icon: Icon(Icons.local_activity),
              selectedIcon: Icon(Icons.local_activity_outlined),
              label: 'profile'),
        ],
      ),

      body: Center(
        child: _widgets.elementAt(_selectedIndex),
      ),
    );
  }
}
