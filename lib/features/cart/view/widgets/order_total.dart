import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

class OrderTotalCard extends StatelessWidget {
  const OrderTotalCard({super.key, required this.total});
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Order Total', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          Text(
            'GHC ${total.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: Colors.green.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
