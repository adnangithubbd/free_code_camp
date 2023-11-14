import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PullToRefresh extends StatefulWidget {
  const PullToRefresh({super.key});

  @override
  State<PullToRefresh> createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
  Future<void> _handleRefresh()async {
    return await Future.delayed(Duration(seconds: 2));
  }
  double  deviceWidth=0;
@override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    deviceWidth=MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
      //deviceWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: Colors.pinkAccent,
        backgroundColor: Colors.indigo,
        height: MediaQuery.of(context).size.height/12,
        showChildOpacityTransition: false,
        animSpeedFactor: 2.0,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRect(
                child: Container(
                  height: 250,
                  color: Colors.deepPurple,
                  child:Text(deviceWidth.toString()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

