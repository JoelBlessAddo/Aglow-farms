import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

enum RadioLayout { horizontal, vertical }

class RadioOption<T> {
  final T value;
  final String label;
  const RadioOption({required this.value, required this.label});
}

class ProfileRadioGroup<T> extends StatelessWidget {
  const ProfileRadioGroup({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
    this.layout = RadioLayout.horizontal,
  });

  final T value;
  final List<RadioOption<T>> options;
  final ValueChanged<T> onChanged;
  final RadioLayout layout;

  @override
  Widget build(BuildContext context) {
    final children = options
        .map((o) => _RadioRow<T>(
              selected: value == o.value,
              label: o.label,
              onTap: () => onChanged(o.value),
            ))
        .toList();

    if (layout == RadioLayout.vertical) {
      return Column(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i != children.length - 1) const SizedBox(height: 10),
          ],
        ],
      );
    }

    return Wrap(
      spacing: 12,
      runSpacing: 10,
      children: children,
    );
  }
}

class _RadioRow<T> extends StatelessWidget {
  const _RadioRow({required this.selected, required this.label, required this.onTap});
  final bool selected;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? BLUE : Colors.black26;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? BLUE.withOpacity(0.08) : const Color(0xFFF7F7F7),
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              size: 18,
              color: color,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected ? BLUE : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
