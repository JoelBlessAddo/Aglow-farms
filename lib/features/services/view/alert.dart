// lib/pages/alerts_page.dart
import 'package:aglow_farms/features/home/view/widgets/alert_card.dart';
import 'package:aglow_farms/utils/alert_data.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'package:flutter/material.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(title: const Text("Alerts")),
      body: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          final alert = alerts[index];
          return AlertCard(
            orderId: alert["orderId"]!,
            time: alert["time"]!,
            message: alert["message"]!,
          );
        },
      ),
    );
  }
}
