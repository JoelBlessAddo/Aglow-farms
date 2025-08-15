import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

class DropdownField<T> extends StatelessWidget {
  const DropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final T value;
  final Map<T, String> items;
  final ValueChanged<T?> onChanged;

  OutlineInputBorder _outline([Color? c]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: c ?? Colors.black26),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 6),
        InputDecorator(
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: WHITE,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            border: _outline(),
            enabledBorder: _outline(),
            focusedBorder: _outline(Colors.black54),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isExpanded: true,
              items: items.entries
                  .map((e) =>
                      DropdownMenuItem<T>(value: e.key, child: Text(e.value)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
