// ignore_for_file: deprecated_member_use

import 'package:aglow_farms/features/profile/view/profile_page.dart';
import 'package:aglow_farms/features/services/view/widgets/alert_page.dart';
import 'package:aglow_farms/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'package:aglow_farms/utils/products.dart';
import 'package:aglow_farms/utils/feed_data.dart';

// your custom widgets
import 'package:aglow_farms/features/home/view/widgets/carousel.dart';
import 'package:aglow_farms/features/home/view/widgets/product_card.dart';
import 'package:aglow_farms/features/home/view/widgets/feed_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: _HomeTopBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Carousel (kept)
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: AppCarousel(),
              ),

              const SizedBox(height: 20),

              // Section: Our Products
              const _SectionTitle('Our Products'),
              const SizedBox(height: 12),

              // Grid: product image behind + overlay texts + button under image
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 290, // 2-up on phones, scales on tablets
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.8,
                ),
                itemCount: products.length,
                itemBuilder: (context, i) => ProductCard(product: products[i]),
              ),

              const SizedBox(height: 20),

              // Section: New Feeds
              const _SectionTitle('New Feeds'),
              const SizedBox(height: 10),

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

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeTopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: WHITE,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 16,
      title: Row(
        children: [
          Image.asset('assets/logo.png', height: 28, fit: BoxFit.contain),
          const SizedBox(width: 8),
          const Text(
            'Aglow Farms',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.black87,
          ),
          onPressed: () {
            customNavigator(context, AlertPage());
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: () {
              customNavigator(context, ProfileManagementPage());
            },
            child: CircleAvatar(
              radius: 14,
              backgroundColor: BLUE.withOpacity(0.12),
              child: Icon(Icons.person, size: 16, color: BLUE),
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: Colors.black87,
        height: 1.1,
      ),
    );
  }
}
