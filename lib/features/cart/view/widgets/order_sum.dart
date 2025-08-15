import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    required this.subtotal,
    required this.discountLabel,
    required this.discountAmount,
    required this.total,
  });

  final num subtotal;
  final String discountLabel;
  final num discountAmount;
  final num total;

  String _m(num n) => n.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _row('Subtotal', 'GHC ${_m(subtotal)}'),
          const SizedBox(height: 8),
          _row('Discount ($discountLabel)', '- GHC ${_m(discountAmount)}', danger: true),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(height: 1),
          ),
          _row('Total', 'GHC ${_m(total)}', highlight: true),
        ],
      ),
    );
  }

  Widget _row(String l, String r, {bool highlight = false, bool danger = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(l, style: TextStyle(fontWeight: FontWeight.w600, color: danger ? Colors.red : Colors.black87)),
        Text(
          r,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: highlight ? Colors.green.shade700 : (danger ? Colors.red : Colors.black87),
          ),
        ),
      ],
    );
  }
}
