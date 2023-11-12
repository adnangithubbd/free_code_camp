import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;

enum Gender { none, male, female, others }

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var gender = Gender.none;
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles '),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text('None'),
                    value: Gender.none,
                    groupValue: gender,
                    contentPadding: EdgeInsets.all(0),
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                        bgColor = Colors.amberAccent;
                        print(gender.toString());
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text('female'),
                    value: Gender.female,
                    groupValue: gender,
                    contentPadding: EdgeInsets.all(0),
                    onChanged: (value) {
                      setState(() {
                        gender = value as Gender;
                        print(gender.toString());
                        bgColor = Colors.pinkAccent;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text('male'),
                    value: Gender.male,
                    groupValue: gender,
                    contentPadding: EdgeInsets.all(0),
                    onChanged: (value) {
                      setState(() {
                        gender = value as Gender;
                        print(gender.toString());
                        bgColor = Colors.indigo;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class wid1 extends StatelessWidget {
  const wid1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('text inside the center... '),
      ),
    );
  }
}

class Rail_navi extends StatefulWidget {
  const Rail_navi({super.key});

  @override
  State<Rail_navi> createState() => _Rail_naviState();
}

class _Rail_naviState extends State<Rail_navi> {
  int _selectedIndex = 0;
  double _groupAlignment = -1.0;
  NavigationRailLabelType _labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  String message = "one. ";
  List<Widget> _screen = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
    FourthScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            labelType: _labelType,
            groupAlignment: _groupAlignment,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            leading: showLeading
                ? FloatingActionButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('leading is clicked')));
                    },
                    child: const Icon(Icons.add),
                  )
                : SizedBox(),
            trailing: showTrailing
                ? IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Trailing is clicked. !')));
                    },
                    icon: Icon(Icons.more_horiz_rounded))
                : SizedBox(),
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  label: Text('First'),
                  selectedIcon: Icon(Icons.favorite)),
              NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  label: Text('second'),
                  selectedIcon: Icon(Icons.bookmark)),
              NavigationRailDestination(
                  icon: Icon(Icons.lens_blur_sharp),
                  label: Text('First'),
                  selectedIcon: Icon(Icons.lens_blur)),
              NavigationRailDestination(
                  icon: Icon(Icons.radar_rounded),
                  label: Text('First'),
                  selectedIcon: Icon(Icons.reddit)),
            ],
          ),
          const VerticalDivider(
            thickness: 2,
            width: 2,
            color: Colors.black,
          ),
          Expanded(
            child: _screen[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  static const List<(Color?, Color? background, ShapeBorder?)> customizations =
      [
    (null, null, OutlineInputBorder()),
    // The FAB uses its default for null parameters.
    (null, Colors.green, null),
    (Colors.white, Colors.green, null),
    (Colors.white, Colors.green, RoundedRectangleBorder()),
  ];
  static const List<(Color?, Color?, ShapeBorder?, Icon?)> _list = [
    (null, null, OutlineInputBorder(), Icon(Icons.ice_skating)),
    (null, Colors.green, null, Icon(Icons.receipt_long)),
    (Colors.white, Colors.green, null, Icon(Icons.hot_tub)),
    (
      Colors.white,
      Colors.green,
      RoundedRectangleBorder(),
      Icon(Icons.breakfast_dining)
    ),
  ];
  int index = 0;
  double _volume = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    children: [
                  TextSpan(
                      text: 'World', style: GoogleFonts.aBeeZee(fontSize: 24)),
                  TextSpan(
                      text: 'amar porna jaha cai',
                      style: GoogleFonts.abel(fontSize: 24)),
                  TextSpan(text: 'joan', style: GoogleFonts.joan(fontSize: 24)),
                ])),
            CupertinoButton(
                child: Text('click'),
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('clicked')));
                }),
            Text(
              'First screen ',
              style: TextStyle(color: Colors.blueAccent),
            ),
            Text(
              'Count $_volume',
              style: GoogleFonts.lalezar(fontSize: 20),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _volume += 10;
                });
              },
              icon: Icon(Icons.surround_sound),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Uri _url = Uri.parse('https://flutter.dev');
          await launchUrl(_url);

          setState(() {
            index = (index + 1) % customizations.length;
          });
        },
        backgroundColor: customizations[index].$1,
        foregroundColor: customizations[index].$2,
        shape: customizations[index].$3,
        child: _list[index].$4,
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool showProgress = true;
  String? res = null;
  bool? isConnected;

  _wait() async {
    res = 'some value';
  }

  Future<bool> checkInternetStatus() async {
    try {
      final url = Uri.https('google.com');
      var response = await http.head(url);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/3,),
          Center(
            child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: TextButton(
                  onPressed: () {

                  },
                  child: Icon(Icons.currency_lira),
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _dialog(context);
        },
      ),
    );
  }


  TextEditingController _controlled = TextEditingController();

  void _dialog(BuildContext contex) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog title'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('AlertDialog description !'),
                  const Text('Input your name '),
                  TextField(
                    controller: _controlled,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                    ),
                  )
                ],
              ),
              contentPadding: const EdgeInsets.all(16.0),
              actions: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Cancell')));
                    Navigator.pop(context);
                  },
                  child: Text('Cancell'),
                ),
                TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(_controlled.text)));
                      Navigator.pop(context);
                    },
                    child: Text('Show'))
              ],
            ));
  }
}

class DialogExample extends StatelessWidget {
  DialogExample({super.key});

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: Row(
            children: [
              Text('AlertDialog description'),
              Text('Input your name'),
              TextField(
                controller: _controller,
                decoration:
                    const InputDecoration(hintText: 'Enter your name hint '),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Canceled')));
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(_controller.text)));
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int counter = 0;
  Color _discolor = Colors.black;
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _makeZero() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = [FirstScreen(), SecondScreen(), ThirdScreen()];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  disabledColor: Colors.blueAccent,
                  onPressed: () {
                    setState(() {
                      if (counter != 0) {
                        counter--;
                      } else {
                        _discolor = Colors.green;
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Nothing to remov...')));
                      }
                    });
                  },
                  icon: Icon(Icons.remove)),
              SizedBox(
                width: 35,
              ),
              Center(
                child: badges.Badge(
                  badgeContent: Text(
                    '$counter',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.calendar_today_sharp),
                    onPressed: () {
                      setState(() {
                        _makeZero();
                      });
                    },
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  icon: Icon(Icons.add)),
              SizedBox(
                height: 50,
              ),
            ],
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blueAccent,
              child: Column(
                children: [
                  Text('Please wait... '),
                ],
              ),
              //////////////////
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_work), label: 'HOme'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline_sharp), label: 'Done'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Fourth Screen'),
    );
  }
}

class RadioExample extends StatefulWidget {
  const RadioExample({Key? key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

enum SingingCharacter { lafayette, jefferson }

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Lafayette'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                  print(value);
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Thomas Jefferson'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                  print(value);
                });
              },
            ),
          ),
        ],
      ),
    ));
  }
}

/*
*       child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Selected index $_selectedIndex'),
              const SizedBox(
                height: 20,
              ),
              Text('Label type ${_labelType.name}'),
              const SizedBox(
                height: 20,
              ),
              Text('Leading type ${showTrailing}'),
              const SizedBox(
                height: 20,
              ),
              Text('Trailing $showTrailing'),
              const SizedBox(
                height: 20,
              ),
              OverflowBar(
                spacing: 1.0,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _labelType = NavigationRailLabelType.none;
                        });
                      },
                      child: const Text('None')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _labelType = NavigationRailLabelType.all;
                        });
                      },
                      child: const Text('All')),
                  ElevatedButton(
                      onPressed: () {
                        _labelType = NavigationRailLabelType.selected;
                      },
                      child: const Text('Selected')),
                ],
              ),
              OverflowBar(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showLeading = !showLeading;
                        });
                      },
                      child: Icon(Icons.leaderboard)),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showTrailing = !showTrailing;
                        });
                      },
                      child: Text('Trailing')),
                ],
              )
            ],
          )*/
