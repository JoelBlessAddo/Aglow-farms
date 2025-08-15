class OrderSummary {
  final String id;            // e.g. #20231225-001
  final DateTime date;        // order date
  final String itemsText;     // "2 Crates of Eggs (Large), 1 ..."
  final double total;         // e.g. 270.00
  final OrderPaymentStatus status;
  final String imageUrl;      // thumbnail asset path

  const OrderSummary({
    required this.id,
    required this.date,
    required this.itemsText,
    required this.total,
    required this.status,
    required this.imageUrl,
  });
}

enum OrderPaymentStatus { paid, due, pending }
