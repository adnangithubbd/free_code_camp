import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatelessWidget {
  const SliverAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            leading: Icon(Icons.menu),
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Title some where. !',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  color: Colors.pink,
                  height: 200,
                  padding: const EdgeInsets.all(12),
                  child: const Text('Inside the container ..!'),
                ),
              )
            ),
          ), SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  color: Colors.pink,
                  height: 200,
                  padding: const EdgeInsets.all(12),
                  child: const Text('Inside the container ..!'),
                ),
              )
            ),
          ), SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  color: Colors.pink,
                  height: 200,
                  padding: const EdgeInsets.all(12),
                  child: const Text('Inside the container ..!'),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
