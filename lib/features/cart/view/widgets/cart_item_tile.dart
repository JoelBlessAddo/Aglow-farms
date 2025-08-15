// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'package:aglow_farms/features/home/model/product.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });

  final Product product;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  String _fmt(num p) => p % 1 == 0 ? p.toStringAsFixed(2) : p.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product.imageUrl,
              height: 64,
              width: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // texts + controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top row: name + delete
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ),
                    IconButton(
                      onPressed: onDelete, // KEEP delete button
                      splashRadius: 18,
                      icon: const Icon(IconlyBroken.delete, color: Colors.red),
                      tooltip: 'Remove from cart',
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'GHC ${_fmt(product.price)} per unit',
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
                const SizedBox(height: 10),

                // stepper
                Row(
                  children: [
                    _QtyBtn(icon: Icons.remove, onTap: onDecrease),
                    const SizedBox(width: 14),
                    Text('$quantity', style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(width: 14),
                    _QtyBtn(icon: Icons.add, onTap: onIncrease),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyBtn extends StatelessWidget {
  const _QtyBtn({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black26),
          color: WHITE,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(icon, size: 18, color: Colors.black87),
        ),
      ),
    );
  }
}
