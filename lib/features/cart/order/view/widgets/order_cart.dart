import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

import 'order_summary.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
    required this.statusPill,
    required this.onReorder,
  });

  final OrderSummary order;
  final Widget statusPill;
  final VoidCallback onReorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              // image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(order.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),

              // date, id, items, total
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _dateAndId(order.date, order.id),
                    const SizedBox(height: 4),
                    Text(order.itemsText,
                        maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.black87)),
                    const SizedBox(height: 6),
                    Text(
                      'GHC ${order.total.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // footer row: status + reorder button
          Row(
            children: [
              statusPill,
              const Spacer(),
              SizedBox(
                height: 36,
                child: ElevatedButton.icon(
                  onPressed: onReorder,
                  icon: const Icon(Icons.refresh, size: 16, color: Colors.white),
                  label: const Text('Reorder', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // swap to your brand green if needed
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _dateAndId(DateTime d, String id) {
    const months = [
      'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'
    ];
    final dateStr = '${months[d.month - 1]} ${d.day}, ${d.year}';
    return Row(
      children: [
        Text(dateStr, style: const TextStyle(fontWeight: FontWeight.w700)),
        const Spacer(),
        Text('Order $id', style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}
