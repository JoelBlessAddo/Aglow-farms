import 'package:aglow_farms/features/cart/view/widgets/edit_address_bottomsheet.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'package:aglow_farms/utils/payment_method_selector.dart';
import 'package:aglow_farms/utils/thank_you_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../order/view/order_tracking.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key, required double total});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool isChecked = false;
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController addressController = TextEditingController(
    text: "",
  );
  final TextEditingController phoneController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton.filledTonal(
                  icon: const Icon(IconlyBroken.bag, size: 28),
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
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: const Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentMethodSelector(
              initialMethod: PaymentMethod.creditCard,
              onChanged: (method) {},
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("1x Product Name", style: TextStyle(color: Colors.grey)),
                Text("₵ 20.00", style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "2x Another Product",
                  style: TextStyle(color: Colors.grey),
                ),
                Text("₵ 30.00", style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Ghc 50.00",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OrderTrackingPage(),
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.black,
                      content: Center(child: Text("Order Confirmed!")),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: BLUE,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Place Order",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
