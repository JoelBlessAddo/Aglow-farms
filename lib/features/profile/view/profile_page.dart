// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:aglow_farms/utils/colors.dart';

import 'widgets /dropdown.dart';
import 'widgets /lable_test.dart';
import 'widgets /profile_radio.dart';
import 'widgets /sestion_card.dart';

class ProfileManagementPage extends StatefulWidget {
  const ProfileManagementPage({super.key});

  @override
  State<ProfileManagementPage> createState() => _ProfileManagementPageState();
}

class _ProfileManagementPageState extends State<ProfileManagementPage> {
  // Controllers
  final _businessNameCtrl = TextEditingController(text: 'Aglow Farm Grocers');

  // Enums / state
  BusinessType _businessType = BusinessType.restaurant;
  OrderType _orderType = OrderType.delivery;
  DefaultPaymentMethod _payment = DefaultPaymentMethod.mobileMoney;

  @override
  void dispose() {
    _businessNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        title: const Text(
          'Profile Management',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: WHITE,
        elevation: 0.5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton.filledTonal(
              icon: const Icon(IconlyBroken.notification),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: BLUE.withOpacity(0.12),
              child: Icon(Icons.person, size: 16, color: BLUE),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          children: [
            // Business Information
            SectionCard(
              title: 'Business Information',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabeledTextField(
                    label: 'Business Name',
                    controller: _businessNameCtrl,
                    filledColor: Colors.grey.shade200, // grey like mock
                    readOnly: false,
                    hint: 'Enter name',
                  ),
                  const SizedBox(height: 14),
                  DropdownField<BusinessType>(
                    label: 'Business Type',
                    value: _businessType,
                    items: const {
                      BusinessType.retailer: 'Retailer',
                      BusinessType.restaurant: 'Restaurant',
                      BusinessType.wholesaler: 'Wholesaler',
                      BusinessType.individual: 'Individual',
                    },
                    onChanged: (v) => setState(() => _businessType = v!),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Order Preferences
            SectionCard(
              title: 'Order Preferences',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Preferred Order Type',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  ProfileRadioGroup<OrderType>(
                    value: _orderType,
                    options: const [
                      RadioOption(value: OrderType.pickup, label: 'Pickup'),
                      RadioOption(value: OrderType.delivery, label: 'Delivery'),
                    ],
                    onChanged: (v) => setState(() => _orderType = v),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Payment Preference
            SectionCard(
              title: 'Payment Preference',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Default Payment Method',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  ProfileRadioGroup<DefaultPaymentMethod>(
                    value: _payment,
                    layout: RadioLayout.vertical, // vertical like mock
                    options: const [
                      RadioOption(
                        value: DefaultPaymentMethod.cashOnDelivery,
                        label: 'Cash on Delivery',
                      ),
                      RadioOption(
                        value: DefaultPaymentMethod.mobileMoney,
                        label: 'Mobile Money',
                      ),
                      RadioOption(
                        value: DefaultPaymentMethod.bankTransfer,
                        label: 'Bank Transfer',
                      ),
                    ],
                    onChanged: (v) => setState(() => _payment = v),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Save button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: persist to backend / local store
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile updated')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: BLUE, // keep your brand color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    color: WHITE,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Local enums for this page (kept simple & scoped)
enum BusinessType { retailer, restaurant, wholesaler, individual }
enum OrderType { pickup, delivery }
enum DefaultPaymentMethod { cashOnDelivery, mobileMoney, bankTransfer }
