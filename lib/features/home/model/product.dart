class Product {
  final String id;            // <- add this
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double? discount;

  const Product({
    required this.id,         // <- add this
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.discount,
  });

  // Optional: equality by id
  @override
  bool operator ==(Object other) => identical(this, other) ||
      (other is Product && other.id == id);
  @override
  int get hashCode => id.hashCode;
}
