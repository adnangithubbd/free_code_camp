import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_code_camp/sample_page/page1.dart';
import 'package:free_code_camp/sample_page/page2.dart';
import 'package:free_code_camp/sample_page/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Page_Slider extends StatefulWidget {
  const Page_Slider({super.key});

  @override
  State<Page_Slider> createState() => _Page_SliderState();
}

class _Page_SliderState extends State<Page_Slider> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.deepPurple,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'App bar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(
                            Icons.menu,
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 12,
                child: PageView(
                  controller: _controller,
                  children: [
                    Page1(),
                    Page2(),
                    Page3(),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                // Adjust the height as needed for SmoothPageIndicator
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(), //  // Use your preferred effect
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
