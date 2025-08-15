import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

enum PaymentMethod { cashOnDelivery, mobileMoney, bankTransfer }

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    super.key,
    required this.method,
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final PaymentMethod method;
  final PaymentMethod selected;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = method == selected;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: WHITE,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? BLUE : Colors.black12, width: isSelected ? 1.3 : 1),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: BLUE.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 22, color: isSelected ? BLUE : Colors.black54),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? BLUE : Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
