import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

class PastOrdersTile extends StatelessWidget {
  const PastOrdersTile({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: WHITE,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black12),
          ),
          child: Row(
            children: const [
              Icon(Icons.list_alt_outlined),
              SizedBox(width: 10),
              Expanded(
                child: Text('View Past Orders',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              Icon(Icons.chevron_right_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
