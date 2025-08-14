// ignore_for_file: deprecated_member_use

import 'package:aglow_farms/utils/feed_data.dart';
import 'package:flutter/material.dart';
import 'package:aglow_farms/features/home/view/widgets/carousel.dart';
import 'package:aglow_farms/features/home/view/widgets/feed_card.dart';
import 'package:aglow_farms/features/home/view/widgets/product_card.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'package:aglow_farms/utils/custom_appbar.dart';
import 'package:aglow_farms/utils/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(height: 30),

              // Carousel
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: AppCarousel(),
              ),

              const SizedBox(height: 15),

              // Featured Products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Products",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(205, 0, 0, 0),
                    ),
                  ),
                  Text("See All", style: TextStyle(fontSize: 15, color: BLUE)),
                ],
              ),
              const SizedBox(height: 15),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),

              const SizedBox(height: 15),

              // New Feeds
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "New Feeds",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(205, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                itemCount: feeds.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final feed = feeds[index];
                  return FeedItem(
                    imageUrl: feed['image']!,
                    title: feed['title']!,
                    subtitle: feed['subtitle']!,
                    description: feed['description']!,
                    onTap: () {},
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
