import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlidImageBar extends StatefulWidget {
  SlidImageBar({Key key}) : super(key: key);

  @override
  _SlidImageBarState createState() => _SlidImageBarState();
}

class _SlidImageBarState extends State<SlidImageBar> {
  final List<String> images = [
    'assets/images/img-services/promotion/promotion-1.jpg',
    'assets/images/img-services/promotion/promotion-2.jpg',
    'assets/images/img-services/promotion/promotion-3.jpg',
    'assets/images/img-services/promotion/promotion-4.jpg',
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((asset) {
        // precacheImage(NetworkImage(imageUrl), context);
        precacheImage(AssetImage(asset), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
      itemBuilder: (context, index) {
        return Container(
          child: Center(
              child: Image.asset(
            images[index],
            fit: BoxFit.cover,
            width: 1000,
            height: 200,
          )),
        );
      },
    );
  }
}
