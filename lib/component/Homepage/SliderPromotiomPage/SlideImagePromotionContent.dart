import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlidImagePromotionContent extends StatefulWidget {
  SlidImagePromotionContent({Key key}) : super(key: key);

  @override
  _SlidImagePromotionContentState createState() => _SlidImagePromotionContentState();
}

class _SlidImagePromotionContentState extends State<SlidImagePromotionContent> {
  final List<String> images = [
    'assets/images/img-services/promotion/promotion-7.jpg',
    'assets/images/img-services/promotion/promotion-1.jpg',
    'assets/images/img-services/promotion/promotion-4.jpg',
    'assets/images/img-services/promotion/promotion-6.jpg',
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
        aspectRatio: 2.2,
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
            height: 370,
          )),
        );
      },
    );
  }
}
