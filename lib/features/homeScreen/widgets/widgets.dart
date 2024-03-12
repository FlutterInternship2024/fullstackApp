import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class BuildCarouselSlider extends StatefulWidget {
  const BuildCarouselSlider({super.key});

  @override
  State<BuildCarouselSlider> createState() => _BuildCarouselSliderState();
}

class _BuildCarouselSliderState extends State<BuildCarouselSlider> {
  List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
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
      child: Column(
        children: [
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
                      decoration: BoxDecoration(color: Colors.green),
                      child: Image.network(
                        i,
                        fit: BoxFit.fitHeight,
                      ));
                },
              );
            }).toList(),
          ),
          DotsIndicator(
            dotsCount: carouselImages.length,
            position: _currentIndex,
            decorator: DotsDecorator(
                activeColor: Colors.green, activeSize: Size(15, 15)
                // Àctive dot colors
                ),
          )
        ],
      ),
    );
  }
}
