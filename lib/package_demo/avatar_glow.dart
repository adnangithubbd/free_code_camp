import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarDemo extends StatelessWidget {
  const AvatarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AvatarGlow(
            endRadius: 100,
            glowColor: Colors.pink,
            repeat: true,
            shape: BoxShape.circle,
            repeatPauseDuration: Duration(milliseconds: 200),
            child: Icon(Icons.menu),
          ),
          Text('Some google font ',style: GoogleFonts.monoton(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),),
        ],
      )),
    );
  }
}
