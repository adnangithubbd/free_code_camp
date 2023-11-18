import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:free_code_camp/sample_page/page1.dart';
import 'package:free_code_camp/sample_page/page2.dart';
import 'package:free_code_camp/sample_page/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({Key? key}) : super(key: key);

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  final List<String> images = [
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Slider Demo'),
      ),
      body: Center(
        child: Column(children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                images[itemIndex],
                fit: BoxFit.cover,
              ),
            ),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(milliseconds: 1000),
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 1,
            ),
          ),
        ]),
      ),
    );
  }
}
