import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

enum DeliveryMethod { delivery, pickup }

class DeliveryPickupSection extends StatelessWidget {
  const DeliveryPickupSection({
    super.key,
    required this.method,
    required this.date,
    required this.slot,
    required this.onMethodChanged,
    required this.onDateChanged,
    required this.onSlotChanged,
  });

  final DeliveryMethod method;
  final DateTime? date;
  final String slot;
  final ValueChanged<DeliveryMethod> onMethodChanged;
  final ValueChanged<DateTime?> onDateChanged;
  final ValueChanged<String> onSlotChanged;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // radios
          Row(
            children: [
              _RadioChip<DeliveryMethod>(
                label: 'Delivery',
                value: DeliveryMethod.delivery,
                groupValue: method,
                onChanged: onMethodChanged,
              ),
              const SizedBox(width: 12),
              _RadioChip<DeliveryMethod>(
                label: 'Pickup',
                value: DeliveryMethod.pickup,
                groupValue: method,
                onChanged: onMethodChanged,
              ),
            ],
          ),
          const SizedBox(height: 12),

          const Text('Preferred Date', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          InkWell(
            onTap: () async {
              final now = DateTime.now();
              final picked = await showDatePicker(
                context: context,
                initialDate: date ?? now,
                firstDate: now,
                lastDate: DateTime(now.year + 1),
              );
              onDateChanged(picked);
            },
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26),
                color: WHITE,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(Icons.event_note_outlined),
                  const SizedBox(width: 10),
                  Text(
                    date == null
                        ? 'Select date'
                        : _formatDate(date!),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),
          const Text('Time Slot', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10),
              color: WHITE,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: slot,
                isExpanded: true,
                items: const [
                  '9:00 AM - 12:00 PM',
                  '12:00 PM - 3:00 PM',
                  '3:00 PM - 6:00 PM'
                ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                onChanged: (v) {
                  if (v != null) onSlotChanged(v);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime d) {
    // Example: August 13th, 2025
    final months = [
      'January','February','March','April','May','June',
      'July','August','September','October','November','December'
    ];
    final day = d.day;
    String suffix = 'th';
    if (day % 10 == 1 && day != 11) suffix = 'st';
    else if (day % 10 == 2 && day != 12) suffix = 'nd';
    else if (day % 10 == 3 && day != 13) suffix = 'rd';
    return '${months[d.month - 1]} ${d.day}$suffix, ${d.year}';
  }
}

class _RadioChip<T> extends StatelessWidget {
  const _RadioChip({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String label;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final selected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? BLUE.withOpacity(0.10) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? BLUE : Colors.black26),
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              size: 18,
              color: selected ? BLUE : Colors.black54,
            ),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(color: selected ? BLUE : Colors.black87)),
          ],
        ),
      ),
    );
  }
}
