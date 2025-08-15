// ignore_for_file: deprecated_member_use

import 'package:aglow_farms/features/cart/order/view/widgets/order_hostory.dart';
import 'package:aglow_farms/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:aglow_farms/utils/colors.dart';
import 'package:aglow_farms/utils/products.dart';
import 'package:aglow_farms/features/cart/view/widgets/check_out_page.dart';

// custom widgets for this page
import 'cart_item_tile.dart';
import 'dv_pickup.dart';
import 'order_sum.dart';
import 'section_tile.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  // simple cart state: productId -> qty
  final Map<String, int> _qty = {};

  // delivery/pickup state
  DeliveryMethod _method = DeliveryMethod.delivery;
  DateTime? _date = DateTime.now();
  String _slot = '9:00 AM - 12:00 PM';

  @override
  void initState() {
    super.initState();
    // seed qty = 1 for every product in cart (demo: take first 2-4)
    for (final p in products.take(4)) {
      _qty[p.id] = 1;
    }
  }

  num get _subtotal {
    num total = 0;
    for (final p in products.where((p) => _qty.containsKey(p.id))) {
      total += p.price * (_qty[p.id] ?? 0);
    }
    return total;
  }

  // demo discount (e.g., 10%)
  num get _discount => _subtotal * 0.10;

  num get _total => _subtotal - _discount;

  void _updateQty(String productId, int next) {
    setState(() {
      if (next <= 0) {
        _qty.remove(productId);
      } else {
        _qty[productId] = next;
      }
    });
  }

  void _removeItem(String productId) {
    setState(() => _qty.remove(productId));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Item removed from cart')));
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = products.where((p) => _qty.containsKey(p.id)).toList();

    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        title: const Text(
          'New Order',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: WHITE,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton.filledTonal(
                  icon: const Icon(IconlyBroken.bag, size: 24),
                  onPressed: () {},
                ),
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '${cartItems.length}',
                      style: const TextStyle(
                        color: WHITE,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // SCROLLABLE BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle('Your Order Items'),
            const SizedBox(height: 10),

            // Order items list (cards)
            ...cartItems.map((p) {
              final q = _qty[p.id]!;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CartItemTile(
                  product: p,
                  quantity: q,
                  onDecrease: () => _updateQty(p.id, q - 1),
                  onIncrease: () => _updateQty(p.id, q + 1),
                  onDelete: () => _removeItem(p.id), // KEEP delete button
                ),
              );
            }).toList(),

            const SizedBox(height: 8),

            // Delivery / Pickup details
            const SectionTitle('Delivery / Pickup Details'),
            const SizedBox(height: 10),
            DeliveryPickupSection(
              method: _method,
              date: _date,
              slot: _slot,
              onMethodChanged: (m) => setState(() => _method = m),
              onDateChanged: (d) => setState(() => _date = d),
              onSlotChanged: (s) => setState(() => _slot = s),
            ),

            const SizedBox(height: 16),

            // Order summary
            const SectionTitle('Order Summary'),
            const SizedBox(height: 10),
            OrderSummaryCard(
              subtotal: _subtotal,
              discountLabel: 'Festive',
              discountAmount: _discount,
              total: _total,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // KEEP Proceed to Payment button (with an outline Quick Reorder above it)
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Quick Reorder (outline)
              SizedBox(
                height: 52,
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    customNavigator(context, OrderHistoryPage());
                  },
                  icon: const Icon(Icons.repeat),
                  label: const Text(
                    'Quick Reorder',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    side: BorderSide(color: Colors.black.withOpacity(0.2)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Proceed to Payment (maintain)
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check, size: 20, color: WHITE),
                  label: const Text(
                    'Proceed to Payment',
                    style: TextStyle(
                      color: WHITE,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BLUE,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Checkout(total: 245.50),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
