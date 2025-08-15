import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

enum OrderStage { pending, confirmed, outForDelivery, completed }

extension _StageMeta on OrderStage {
  String get label {
    switch (this) {
      case OrderStage.pending: return 'Pending';
      case OrderStage.confirmed: return 'Confirmed';
      case OrderStage.outForDelivery: return 'Out for Delivery';
      case OrderStage.completed: return 'Completed';
    }
  }

  IconData get icon {
    switch (this) {
      case OrderStage.pending: return Icons.inventory_2_outlined;
      case OrderStage.confirmed: return Icons.check_circle_outline;
      case OrderStage.outForDelivery: return Icons.local_shipping_outlined;
      case OrderStage.completed: return Icons.home_outlined;
    }
  }
}

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    super.key,
    required this.current,
    required this.stages,
  });

  final OrderStage current;
  final List<OrderStage> stages;

  @override
  Widget build(BuildContext context) {
    final green = Colors.green.shade700;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withOpacity(0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardHeader(title: 'Order Status'),
          const SizedBox(height: 8),
          Row(
            children: [
              for (int i = 0; i < stages.length; i++) ...[
                _StageDot(
                  stage: stages[i],
                  isActive: _isActive(stages[i]),
                  isCompleted: _isCompleted(stages[i]),
                  activeColor: green,
                ),
                if (i != stages.length - 1)
                  _ConnectorLine(
                    isPassed: _isCompleted(stages[i]) || stages[i] == current,
                    color: green,
                  ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          // labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: stages.map((s) {
              final isActive = _isActive(s) || _isCompleted(s);
              return Expanded(
                child: Text(
                  s.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    color: isActive ? green : Colors.black54,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  bool _isActive(OrderStage s) => s == current;
  bool _isCompleted(OrderStage s) => stages.indexOf(s) < stages.indexOf(current);
}

class _ConnectorLine extends StatelessWidget {
  const _ConnectorLine({required this.isPassed, required this.color});
  final bool isPassed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: isPassed ? color : Colors.black26,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _StageDot extends StatelessWidget {
  const _StageDot({
    required this.stage,
    required this.isActive,
    required this.isCompleted,
    required this.activeColor,
  });

  final OrderStage stage;
  final bool isActive;
  final bool isCompleted;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    final Color border = isActive || isCompleted ? activeColor : Colors.black26;
    final Color bg = isCompleted ? activeColor : (isActive ? activeColor.withOpacity(0.1) : Colors.white);
    final Color iconColor = isCompleted ? Colors.white : (isActive ? activeColor : Colors.black45);

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: Border.all(color: border, width: 2),
      ),
      child: Icon(stage.icon, size: 18, color: iconColor),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
    );
  }
}
