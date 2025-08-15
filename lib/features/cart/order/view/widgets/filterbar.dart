import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
    required this.onDateRangeTap,
    required this.onStatusTap,
    this.dateRangeLabel = 'Date Range',
    this.statusLabel = 'Status',
  });

  final VoidCallback onDateRangeTap;
  final VoidCallback onStatusTap;
  final String dateRangeLabel;
  final String statusLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _FilterButton(
            icon: Icons.date_range_outlined,
            label: dateRangeLabel,
            onTap: onDateRangeTap,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _FilterButton(
            icon: Icons.filter_list_outlined,
            label: statusLabel,
            onTap: onStatusTap,
          ),
        ),
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF7F7F7),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: Colors.black87),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
