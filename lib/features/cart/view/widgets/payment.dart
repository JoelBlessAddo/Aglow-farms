// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:aglow_farms/utils/colors.dart';
import 'package:aglow_farms/utils/thank_you_page.dart';

import '../../../../utils/payment_method_selector.dart' hide PaymentMethod;
import 'order_total.dart';
import 'payment_tile.dart';



class Checkout extends StatefulWidget {
  const Checkout({super.key, this.total = 245.50});

  /// Pass the computed cart total here (defaults for demo).
  final double total;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  PaymentMethod _selected = PaymentMethod.cashOnDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        title: const Text('Payments', style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: WHITE,
        elevation: 0.5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton.filledTonal(
                  icon: const Icon(IconlyBroken.notification, size: 22),
                  onPressed: () {},
                ),
                // optional badge
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: BLUE.withOpacity(0.12),
              child: Icon(Icons.person, size: 16, color: BLUE),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Total (NO outstanding balance)
            OrderTotalCard(total: widget.total),

            const SizedBox(height: 18),
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),

            // Method tiles
            PaymentMethodTile(
              method: PaymentMethod.cashOnDelivery,
              selected: _selected,
              title: 'Cash on Delivery',
              subtitle: 'Pay in cash when your order arrives.',
              icon: Icons.payments_outlined,
              onTap: () => setState(() => _selected = PaymentMethod.cashOnDelivery),
            ),
            const SizedBox(height: 12),

            PaymentMethodTile(
              method: PaymentMethod.mobileMoney,
              selected: _selected,
              title: 'Mobile Money',
              subtitle: 'Pay instantly via your mobile money account.',
              icon: Icons.phone_iphone_outlined,
              onTap: () => setState(() => _selected = PaymentMethod.mobileMoney),
            ),
            const SizedBox(height: 12),

            PaymentMethodTile(
              method: PaymentMethod.bankTransfer,
              selected: _selected,
              title: 'Bank Transfer',
              subtitle: 'Transfer funds directly to our bank account.',
              icon: Icons.account_balance_outlined,
              onTap: () => setState(() => _selected = PaymentMethod.bankTransfer),
            ),

            const SizedBox(height: 90), // space for bottom button
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: SizedBox(
            height: 56,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: trigger real payment flow based on _selected
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ThankYou()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: BLUE, // keep your brand color
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
              ),
              child: const Text(
                'Confirm Payment',
                style: TextStyle(color: WHITE, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
