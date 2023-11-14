import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_code_camp/profile.dart';
import 'package:free_code_camp/squre.dart';
import 'package:free_code_camp/koko/story.dart';

class ResponsiveDemo extends StatefulWidget {
  const ResponsiveDemo({super.key});

  @override
  State<ResponsiveDemo> createState() => _ResponsiveDemoState();
}

class _ResponsiveDemoState extends State<ResponsiveDemo> {
  final List _post = [
    'post1',
    'post2',
    'post4',
    'post3',
    'post5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: _post.length,
                  itemBuilder: (context,index){
                  return Story(child: index.toString());
              }),

          ),
          Expanded(
            flex: 12,
              child: ListView.builder(
                  itemCount: _post.length,
                  itemBuilder: (context, index) {
                    return MySqure(child: _post[index]);
                  })),
        ],
      ),
    ));
  }
}
