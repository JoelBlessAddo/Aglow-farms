import 'package:aglow_farms/features/cart/view/widgets/cart_details.dart';
import 'package:aglow_farms/features/home/view/home_page.dart';
import 'package:aglow_farms/features/profile/view/profile_page.dart';
import 'package:aglow_farms/features/services/view/widgets/services_page.dart';
import 'package:aglow_farms/features/support/support.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final pages = [
    const HomePage(),
    const Servicespage(),
    const CartPage(),
    const ProfilePage(),
    const Support(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: BLUE,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.home),
            icon: Icon(IconlyBroken.home),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.notification),
            icon: Icon(IconlyBroken.notification),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.bag),
            icon: Icon(IconlyBroken.bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyBroken.profile),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.call),
            icon: Icon(IconlyBroken.call),
            label: 'Supports',
          ),
        ],
      ),
    );
  }
}
