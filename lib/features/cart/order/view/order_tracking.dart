// ignore_for_file: deprecated_member_use

import 'package:aglow_farms/features/services/view/widgets/alert_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:aglow_farms/utils/colors.dart';
import '../../../../utils/navigator.dart';
import '../../../profile/view/profile_page.dart';
import 'widgets/div_info.dart';
import 'widgets/order_card.dart';
import 'widgets/order_hostory.dart';
import 'widgets/past_orders.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        title: const Text(
          'Order Tracking',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: WHITE,
        elevation: 0.5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton.filledTonal(
              icon: const Icon(IconlyBroken.notification),
              onPressed: ()  {
              customNavigator(context, AlertPage());
            },
            ),
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ORDER STATUS
            OrderStatusCard(
              current: OrderStage.outForDelivery, // change dynamically
              stages: const [
                OrderStage.pending,
                OrderStage.confirmed,
                OrderStage.outForDelivery,
                OrderStage.completed,
              ],
            ),
            const SizedBox(height: 16),

            // DELIVERY INFORMATION
            DeliveryInfoCard(
              expectedDateLabel: 'Monday, Oct 28th',
              windowLabel: '10:00 AM - 1:00 PM',
              onViewDetails: () {
                
              },
            ),
            const SizedBox(height: 16),

            // VIEW PAST ORDERS
            PastOrdersTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderHistoryPage()),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
