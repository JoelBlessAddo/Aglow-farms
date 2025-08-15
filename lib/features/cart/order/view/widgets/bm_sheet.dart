import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';
// use a package import so paths don’t break

import 'order_summary.dart';

class ReorderBottomSheet extends StatelessWidget {
  const ReorderBottomSheet({
    super.key,
    required this.order,
    required this.onConfirm,
  });

  final OrderSummary order;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16, right: 16, top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Reorder Items',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    order.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    order.itemsText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Total', style: TextStyle(fontWeight: FontWeight.w600)),
                const Spacer(),
                Text('GHC ${order.total.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.green.shade700, fontWeight: FontWeight.w800)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                      side: BorderSide(color: Colors.black.withOpacity(0.2)),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    child: const Text('Reorder',
                      style: TextStyle(color: WHITE, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
