// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:aglow_farms/features/auth/login/view/login.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _goNext());
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(seconds: 10));

    if (!mounted || _navigated) return;
    _navigated = true;

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/bg.jpg', fit: BoxFit.cover, gaplessPlayback: true,),
          ),

          // Positioned(
          //   top: screenHeight * 0.1,
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //     child: Text(
          //       textAlign: TextAlign.center,
          //       "Aglow-Farms\nWhere Technology Meets the Land",
          //       style: TextStyle(fontSize: 20, color: WHITE),
          //     ),
          //   ),
          // ),
          Positioned(
            bottom: screenHeight * 0.05,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenHeight * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Aglow-Farms\nEat Fresh, Live Healthy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: BLACK,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
