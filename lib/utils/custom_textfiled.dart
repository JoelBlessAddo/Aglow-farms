import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aglow_farms/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.onTap,
    this.inputFormatters,
  });

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool enabled;
  final int maxLines;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;

  OutlineInputBorder _outline([Color? color]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color ?? Colors.grey.shade400, width: 1),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          textInputAction: textInputAction,
          readOnly: readOnly,
          enabled: enabled,
          maxLines: maxLines,
          onTap: onTap,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            border: _outline(),
            enabledBorder: _outline(),
            disabledBorder: _outline(Colors.grey.shade300),
            focusedBorder: _outline(BLUE),
            errorBorder: _outline(Colors.red.shade400),
            focusedErrorBorder: _outline(Colors.red.shade400),
            fillColor: WHITE,
            filled: true,
          ),
        ),
      ],
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.validator,
    this.textInputAction,
  });

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscure = true;

  OutlineInputBorder _outline([Color? color]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color ?? Colors.grey.shade400, width: 1),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscure,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            hintText: widget.hint ?? '••••••••',
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscure = !_obscure),
              icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            border: _outline(),
            enabledBorder: _outline(),
            focusedBorder: _outline(BLUE),
            errorBorder: _outline(Colors.red.shade400),
            focusedErrorBorder: _outline(Colors.red.shade400),
            fillColor: WHITE,
            filled: true,
          ),
        ),
      ],
    );
  }
}
