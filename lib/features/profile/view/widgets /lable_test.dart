import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.readOnly = false,
    this.filledColor = WHITE,
  });

  final String label;
  final TextEditingController controller;
  final String? hint;
  final bool readOnly;
  final Color filledColor;

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
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hint,
            isDense: true,
            filled: true,
            fillColor: filledColor,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            border: _outline(),
            enabledBorder: _outline(),
            focusedBorder: _outline(Colors.black54),
          ),
        ),
      ],
    );
  }
}
