import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_code_camp/home_body_scroll.dart';

import 'bottom_nav.dart';
import 'carosole_slide.dart';

class HomePaged extends StatefulWidget {
  const HomePaged({super.key});

  @override
  State<HomePaged> createState() => _HomePagedState();
}

class _HomePagedState extends State<HomePaged> {
  int _index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _onItemTapped(int inx) {
    setState(() {
      _index = inx;
    });
  }

  toggleDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home page. !'.toUpperCase()),
      ),

      bottomNavigationBar: BottomNavigation(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('this is header area'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _index == 0,
              leading: Icon(Icons.home),
              onTap: () {
                _onItemTapped(0);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              leading: Icon(Icons.alarm),
              selected: _index == 1,
              onTap: () {
                _onItemTapped(1);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              leading: Icon(Icons.settings),
              selected: _index == 2,
              onTap: () {
                _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget setPage(BuildContext context, param1) {
  Color red800 = Colors.blue;

  return Stack(
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
        color: red800,
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
      ),

      Container(), // Required some widget in between to float AppBar

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
              param1.currentState!.openDrawer();
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
              icon: Icon(Icons.search, color: red800),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: red800),
              onPressed: () {},
            )
          ],
        ),
      )
    ],
  );
}

///////////////////////
class IcnBtn extends StatelessWidget {
  const IcnBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: Icon(
                    Icons.question_mark,
                    color: Colors.blue,
                  ),
                ),
                Text('FAQ'),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: Icon(
                    Icons.heart_broken,
                    color: Colors.pink,
                  ),
                ),
                Text('Wish List'),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: Icon(
                    Icons.assignment_return,
                    color: Colors.amber,
                  ),
                ),
                const Text('Return policy'),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: Icon(
                    Icons.category,
                    color: Colors.blueAccent,
                  ),
                ),
                Text('Categories'),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: Icon(
                    Icons.sell_sharp,
                    color: Colors.amberAccent,
                  ),
                ),
                Text('Order'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {

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

  Widget build(BuildContext context) {
    int _selectedIndex = 0;

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
              label: 'Home'),
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
