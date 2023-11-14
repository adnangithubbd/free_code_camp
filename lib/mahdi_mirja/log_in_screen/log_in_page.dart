import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_code_camp/mahdi_mirja/log_in_screen/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

import 'check_box.dart';

class logIn_page extends StatefulWidget {
  const logIn_page({super.key});

  @override
  State<logIn_page> createState() => _LogIn_pageState();
}

class _LogIn_pageState extends State<logIn_page> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: [

          IconButton(
              onPressed: () {
                print('Near me is clicked');
              },
              icon: const Icon(
                Icons.near_me,
                color: Colors.pinkAccent,
              )),
          PopupMenuButton(
              icon: const Icon(
                Icons.more_outlined,
                color: Colors.white,
              ),
              onSelected: (int value) {
                print(value);
              },
              itemBuilder: (BuildContext context) => [
                    PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                            height: 24,
                            width: 24,
                          ),
                          Text('google'.toUpperCase()),
                        ],
                      ),
                    ),
                  ]),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                    hintText: 'User hint',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    )),
                //detecting enter
                onSubmitted: (value) {
                  print(value);
                },
                onTap: () async {
                  await Clipboard.setData(
                      ClipboardData(text: _usernameController.text));
                },
                onChanged: (nothing) {
                  print(_usernameController.text);
                },
                textInputAction: TextInputAction.search,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'hi ya habibi.. how are you?? ',
                    style: GoogleFonts.bodoniModa(
                        textStyle: const TextStyle(color: Colors.indigo)),
                  ),
                  CheckboxDemo(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/mobile.png',
                      height: 30,
                      width: 40,
                    ),
                    const Text('batter bar'),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      height: 30,
                      width: 40,
                    ),
                    const Text('battry bar'),
                    TextButton(
                        onPressed: () {
                          print('Clicked');
                        },
                        child: const Text('Clickable')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: DrawerDemo(),
    )
    );
  }
}
