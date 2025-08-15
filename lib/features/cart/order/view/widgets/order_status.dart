import 'package:flutter/material.dart';
import 'order_summary.dart';

class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.status});
  final OrderPaymentStatus status;

  @override
  Widget build(BuildContext context) {
    final data = _style(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: data.bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        data.label,
        style: TextStyle(fontWeight: FontWeight.w700, color: data.text),
      ),
    );
  }

  _PillStyle _style(OrderPaymentStatus s) {
    switch (s) {
      case OrderPaymentStatus.paid:
        return _PillStyle(
          'Paid',
          Colors.green.withOpacity(0.12),
          Colors.green.shade800,
        );
      case OrderPaymentStatus.due:
        return _PillStyle(
          'Due',
          Colors.red.withOpacity(0.12),
          Colors.red.shade800,
        );
      case OrderPaymentStatus.pending:
        return _PillStyle(
          'Pending',
          Colors.orange.withOpacity(0.14),
          Colors.orange.shade800,
        );
    }
  }
}

class _PillStyle {
  final String label;
  final Color bg;
  final Color text;
  _PillStyle(this.label, this.bg, this.text);
}
