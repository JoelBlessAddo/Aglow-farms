import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

class DeliveryInfoCard extends StatelessWidget {
  const DeliveryInfoCard({
    super.key,
    required this.expectedDateLabel,
    required this.windowLabel,
    required this.onViewDetails,
  });

  final String expectedDateLabel;
  final String windowLabel;
  final VoidCallback onViewDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Title('Delivery Information'),
          const SizedBox(height: 10),

          _RowItem(
            icon: Icons.event_available_outlined,
            title: 'Expected Delivery:',
            value: expectedDateLabel,
          ),
          const SizedBox(height: 10),

          _RowItem(
            icon: Icons.access_time,
            title: 'Delivery Window:',
            value: windowLabel,
          ),

          const SizedBox(height: 14),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onViewDetails,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // replace with your GREEN if you have one
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
              ),
              child: const Text(
                'View Order Details',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800));
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem({required this.icon, required this.title, required this.value});
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black87),
        const SizedBox(width: 10),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
