import 'package:flutter/material.dart';
import 'package:free_code_camp/carosole_slide.dart';
import 'package:free_code_camp/mahdi_mirja/log_in_screen/log_in_page.dart';
import 'package:free_code_camp/product.dart';
import 'package:free_code_camp/profile.dart';
import 'package:free_code_camp/koko/pull_to_refresh.dart';
import 'package:free_code_camp/koko/responsive.dart';
import 'package:free_code_camp/tab_bar_demo.dart';

import 'bottom_nav.dart';
import 'draft.dart';
import 'home_screen.dart';

import 'koko/bottom_nav_demo.dart';
import 'koko/clip_rect.dart';
import 'koko/date_picker.dart';
import 'koko/gestre_detec.dart';
import 'koko/gridview_demo.dart';
import 'koko/slider_demo.dart';
import 'koko/sliver_app_bar.dart';
import 'koko/time_picker.dart';
import 'mahdi_mirja/user_list/shared_pref.dart';
import 'mahdi_mirja/web_view.dart';
import 'nav_rail.dart';

void main() async {
  Api api = Api();
  await api.fetchData();

  print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');

  print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  api.fetchData();
   //fetchPhoto();
  // This widget is the root of your application.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:    TimePickerDemo(),
    );
  }
}


















class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
