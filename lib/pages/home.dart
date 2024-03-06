import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List Wallpapers = [
    "image/image1.jpg",
    "image/image2.jpg",
    "image/image3.jpg"
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            const Text(
              "Wallify",
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(
              height: 30,
            ),
            CarouselSlider.builder(
              itemCount: Wallpapers.length,
              itemBuilder: (context, index, realindex) {
                final res = Wallpapers[index];
                return buildImage(res, index);
              },
              options: CarouselOptions(
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height / 1.5,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
            ),
            const SizedBox(
              height: 20,
            ),
            buildIndicator()
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 3,
        effect: const SlideEffect(
            dotWidth: 15, dotHeight: 15, activeDotColor: Colors.blue),
      );

  Widget buildImage(String urlImage, int index) => Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
}
