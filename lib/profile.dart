import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Gender { none, male, female, others }

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          children: [
            Row(
              children: [
                RadioListTile(
                  title: Text('None'),
                  value: Gender.none,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as Gender;
                      print(gender.toString());
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Male'),
                  value: Gender.male,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as Gender;
                      print(gender.toString());
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Female'),
                  value: Gender.female,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as Gender;
                      print(gender.toString());
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
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
