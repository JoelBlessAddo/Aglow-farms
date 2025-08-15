// ignore_for_file: deprecated_member_use

import 'package:aglow_farms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(title: const Text('Support')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // CALL US CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: BLUE.withOpacity(0.3),
                      ),
                      child: Icon(Icons.call, size: 40, color: BLUE),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Call Us',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      '+233 594-191-836',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Speak directly to our support team for urgent assistance or inquiries about your orders.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        // TODO: implement call functionality
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: BLUE,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Call Now',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: WHITE,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // WHATSAPP CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: GREEN.withOpacity(0.3),
                      ),
                      child: Icon(Icons.chat_sharp, size: 40, color: GREEN),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Chat us on WhatsApp',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Connect with us instantly on WhatsApp.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Send us a message anytime for quick responses, order updates, or general support.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        // TODO: implement WhatsApp chat functionality
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: BLUE,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Chat Now',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: WHITE,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
