 import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:free_code_camp/product.dart';

 class Carosole extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
     return CarouselSlider(
       items:Api.thum.map((url) {
         return Builder(
           builder: (BuildContext context) {
             return Container(
               margin: const EdgeInsets.all(6.0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8.0),
                 image: DecorationImage(
                   image: NetworkImage(url),
                   fit: BoxFit.cover,
                 ),
               ),
             );
           },
         );
       }).toList(),
       options: CarouselOptions(
         height: 120.0,
         enlargeCenterPage: true,
         autoPlay: true,
         aspectRatio: 16 / 9,
         autoPlayCurve: Curves.fastOutSlowIn,
         enableInfiniteScroll: true,
         autoPlayAnimationDuration: const Duration(milliseconds: 800),
         viewportFraction: 0.8,
         scrollDirection: Axis.horizontal
       ),
     );

   }
 }
 class Carosole2 extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
     return CarouselSlider(
       items:Api.thum2.map((url2) {
         return Builder(
           builder: (BuildContext context) {
             return Container(
               margin: const EdgeInsets.all(6.0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8.0),
                 image: DecorationImage(
                   image: NetworkImage(url2),
                   fit: BoxFit.cover,
                 ),
               ),
             );
           },
         );
       }).toList(),
       options: CarouselOptions(
         height: 120.0,
         enlargeCenterPage: true,
         autoPlay: true,
         aspectRatio: 16 / 9,
         autoPlayCurve: Curves.fastOutSlowIn,
         enableInfiniteScroll: true,
         autoPlayAnimationDuration: const Duration(milliseconds: 800),
         viewportFraction: 0.8,
         scrollDirection: Axis.horizontal
       ),
     );

   }
 }

