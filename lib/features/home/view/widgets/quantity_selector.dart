import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  final List<String> sizes; // Example: ['S', 'M', 'L']
  final ValueChanged<String> onSizeSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.onSizeSelected,
  });

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.sizes.map((size) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<String>(
              value: size,
              groupValue: selectedSize,
              onChanged: (value) {
                setState(() {
                  selectedSize = value;
                });
                widget.onSizeSelected(value!);
              },
              activeColor: Colors.green,
            ),
            Text(
              size,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        );
      }).toList(),
    );
  }
}
