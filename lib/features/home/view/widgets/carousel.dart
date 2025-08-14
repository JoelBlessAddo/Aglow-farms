import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AppCarousel extends StatelessWidget {
  // Local assets list
  final List<String> carouselImages = [
    'assets/images/c1.png',
    'assets/images/c2.png',
    'assets/images/c3.png',
  ];

  AppCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: carouselImages.map((path) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(path, fit: BoxFit.cover, width: double.infinity),
        );
      }).toList(),
    );
  }
}
