// ignore_for_file: deprecated_member_use

import 'package:aglow_farms/features/home/model/product.dart';
import 'package:aglow_farms/features/home/view/widgets/product_details.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  String _formatPrice(num p) {
    // Show whole number without .0, else 2 dp
    return p % 1 == 0 ? p.toStringAsFixed(0) : p.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image area with overlays
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetails(product: product),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Stack(
                children: [
                  // Background image
                  AspectRatio(
                    aspectRatio: 1.1, // looks close to your mock
                    child: Image.asset(product.imageUrl, fit: BoxFit.cover),
                  ),

                  // Gradient for legibility
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.10),
                            Colors.black.withOpacity(0.40),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Name + price (overlay)
                  Positioned(
                    left: 12,
                    bottom: 12,
                    right: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: WHITE,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            height: 1.05,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'GHC ${_formatPrice(product.price)}',
                          style: const TextStyle(
                            color: WHITE,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // // Optional promo badge (show if product has discount field)
                  // if ((product.discount ?? 0) > 0)
                  //   Positioned(
                  //     left: 10,
                  //     top: 10,
                  //     child: Container(
                  //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //       decoration: BoxDecoration(
                  //         color: Colors.orange.shade600,
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       child: Text(
                  //         '${product.discount!.toStringAsFixed(0)}% Off',
                  //         style: const TextStyle(
                  //           color: WHITE,
                  //           fontSize: 11,
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ),

          // const SizedBox(height: 10),
          Spacer(),

          // Add to Cart button (under image)
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: SizedBox(
              height: 42,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Item added to cart'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // use your custom GREEN if available
                  foregroundColor: WHITE,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
