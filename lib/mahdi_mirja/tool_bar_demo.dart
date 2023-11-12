
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toolbar_demo extends StatelessWidget {
   const Toolbar_demo({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(

       body: Column(children: [
         Image.network('',height: 90,width: 90,),
         SizedBox(
           height: 24,
         ),
         Text('Name..\n Title of the auther'),

       ],),
     );
   }
 }
