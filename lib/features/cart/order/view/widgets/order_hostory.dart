// ignore_for_file: deprecated_member_use

import 'package:aglow_farms/features/cart/order/view/widgets/order_summary.dart';
import 'package:aglow_farms/features/cart/view/cart.dart';
import 'package:aglow_farms/features/cart/view/widgets/cart_details.dart';
import 'package:aglow_farms/features/profile/view/profile_page.dart';
import 'package:aglow_farms/utils/bottom_nav.dart';
import 'package:aglow_farms/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'bm_sheet.dart';
import 'filterbar.dart';
import 'order_cart.dart';
import 'order_status.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  // Demo data – swap with your Firestore/REST results
  final List<OrderSummary> _all = [
    OrderSummary(
      id: '#20231225-001',
      date: DateTime(2023, 12, 25),
      itemsText: '2 Crates of Eggs (Large), 1',
      total: 270,
      status: OrderPaymentStatus.paid,
      imageUrl: 'assets/egg.png',
    ),
    OrderSummary(
      id: '#20231210-002',
      date: DateTime(2023, 12, 10),
      itemsText: '1 Crate of Eggs (Medium), 2',
      total: 360,
      status: OrderPaymentStatus.paid,
      imageUrl: 'assets/egg.png',
    ),
    OrderSummary(
      id: '#20231120-003',
      date: DateTime(2023, 11, 20),
      itemsText: '3 Crates of Eggs (Large)',
      total: 240,
      status: OrderPaymentStatus.due,
      imageUrl: 'assets/egg.png',
    ),
    OrderSummary(
      id: '#20231105-004',
      date: DateTime(2023, 11, 5),
      itemsText: '1 Broiler Chicken',
      total: 150,
      status: OrderPaymentStatus.paid,
      imageUrl: 'assets/egg.png',
    ),
  ];

  DateTimeRange? _range;
  OrderPaymentStatus? _status;

  List<OrderSummary> get _filtered {
    return _all.where((o) {
      final inRange = _range == null
          ? true
          : (o.date.isAfter(_range!.start.subtract(const Duration(days: 1))) &&
                o.date.isBefore(_range!.end.add(const Duration(days: 1))));
      final byStatus = _status == null ? true : o.status == _status;
      return inRange && byStatus;
    }).toList()..sort((a, b) => b.date.compareTo(a.date));
  }

  Future<void> _pickRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 2),
      lastDate: DateTime(now.year + 2),
      initialDateRange:
          _range ??
          DateTimeRange(
            start: now.subtract(const Duration(days: 30)),
            end: now,
          ),
    );
    if (picked != null) setState(() => _range = picked);
  }

  Future<void> _pickStatus() async {
    final v = await showModalBottomSheet<OrderPaymentStatus?>(
      context: context,
      showDragHandle: true,
      builder: (_) => _StatusSheet(current: _status),
    );
    if (v is OrderPaymentStatus? Function()) return; // just to satisfy lints
    setState(() => _status = v);
  }

  void _reorder(OrderSummary order) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => ReorderBottomSheet(
        order: order,
        onConfirm: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Items added to cart for reorder')),
          );
        },
      ),
    );
  }

  /*ReorderBottomSheet(
        order: order,
        onConfirm: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Items added to cart for reorder')),
          );
          // TODO: Add to cart provider & navigate to cart if you want
        },
      ),
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        title: const Text(
          'Order History',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: WHITE,
        elevation: 0.5,
        leading: GestureDetector(
          onTap: () {
            customNavigator(context, BottomNav());
          },
          child: Icon(Icons.arrow_back_ios, size: 16, color: BLACK),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                customNavigator(context, ProfileManagementPage());
              },
              child: CircleAvatar(
                radius: 14,
                backgroundColor: BLUE.withOpacity(0.12),
                child: Icon(Icons.person, size: 16, color: BLUE),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          children: [
            // Filter bar
            FilterBar(
              onDateRangeTap: _pickRange,
              onStatusTap: _pickStatus,
              dateRangeLabel: _range == null
                  ? 'Date Range'
                  : _rangeText(_range!),
              statusLabel: _status == null ? 'Status' : statusLabel(_status!),
            ),
            const SizedBox(height: 12),

            // Orders list
            ListView.separated(
              itemCount: _filtered.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) {
                final o = _filtered[i];
                return OrderCard(
                  order: o,
                  statusPill: StatusPill(status: o.status),
                  onReorder: () => _reorder(o),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _rangeText(DateTimeRange r) =>
      '${_fmtDate(r.start)} - ${_fmtDate(r.end)}';

  String _fmtDate(DateTime d) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }
}

class _StatusSheet extends StatelessWidget {
  const _StatusSheet({required this.current});
  final OrderPaymentStatus? current;

  @override
  Widget build(BuildContext context) {
    final opts = OrderPaymentStatus.values;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final s in opts)
              ListTile(
                title: Text(statusLabel(s)),
                trailing: ifSelected(s == current),
                onTap: () => Navigator.pop(context, s),
              ),
            ListTile(
              title: const Text('Clear'),
              trailing: ifSelected(current == null),
              onTap: () => Navigator.pop(context, null),
            ),
          ],
        ),
      ),
    );
  }

  Widget ifSelected(bool v) => v
      ? const Icon(Icons.check, color: Colors.green)
      : const SizedBox.shrink();
}

String statusLabel(OrderPaymentStatus s) {
  switch (s) {
    case OrderPaymentStatus.paid:
      return 'Paid';
    case OrderPaymentStatus.due:
      return 'Due';
    case OrderPaymentStatus.pending:
      return 'Pending';
  }
}
