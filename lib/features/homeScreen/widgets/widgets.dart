import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCarouselSlider extends StatefulWidget {
  const BuildCarouselSlider({super.key});

  @override
  State<BuildCarouselSlider> createState() => _BuildCarouselSliderState();
}

class _BuildCarouselSliderState extends State<BuildCarouselSlider> {
  List<String> carouselImages = [
    'assets/images/banner1.jpeg',
    'assets/images/banner2.jpeg',
    'assets/images/banner3.jpeg',
    'assets/images/banner4.jpeg'
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    int _totalDots = carouselImages.length;

    int _validPosition(int position) {
      if (position >= _totalDots) return 0;
      if (position < 0) return _totalDots - 1;
      return position;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "OFFERS FOR YOU",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = _validPosition(index);
                    });
                  },
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: carouselImages.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(20)),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                          ));
                    },
                  );
                }).toList(),
              ),
              Center(
                child: DotsIndicator(
                  dotsCount: carouselImages.length,
                  position: _currentIndex,
                  decorator: DotsDecorator(
                      activeColor: Colors.green, activeSize: Size(15, 15)
                      // Àctive dot colors
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
