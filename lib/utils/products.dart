import 'package:aglow_farms/features/home/model/product.dart';

List<Product> products = [
  Product(
    id: 'eggs_crate',
    name: 'Farm Fresh Eggs (Crate)',
    description: 'Fresh eggs from local farm.',
    price: 60.0,
    imageUrl: 'assets/egg.png',
    discount: 10,
  ),
  Product(
    id: "dev_feed",
    price: 29.99,
    imageUrl: 'assets/feed.png',
    name: 'Developer Feed',
    description: 'Chicken feeds for your farm',
  ),
  Product(
    id: 'broiler_bird',
    name: 'Processed full chicken',
    description:
        'Freshly processed chicken, ready for cooking and consumption.',
    price: 150.0,
    imageUrl: 'assets/feed.png',
  ),
];
