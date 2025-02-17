import 'package:e_commerce_f/common/default_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPayment = "Visa";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(size: size, icon: Icons.arrow_back_sharp, actionIcon: Icons.shopping_bag_outlined),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text("Payment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildPaymentOption("Credit Card", "assets/images/img_4.png"),
            _buildPaymentOption("Paypal", "assets/images/img_4.png"),
            _buildPaymentOption("Visa", "assets/images/img_4.png", isSelected: true),
            _buildPaymentOption("Google Pay", "assets/images/img_4.png"),
            _buildAddCardButton(),
            const SizedBox(height: 20),
            const Text("History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(child: _buildHistoryList()
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, String iconPath, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () => setState(() => selectedPayment = title),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: selectedPayment == title ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        ),
        child: Row(
          children: [
            Image.asset(iconPath, width: 30, height: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selectedPayment == title ? Colors.white : Colors.black,
                ),
              ),
            ),
            Icon(
              selectedPayment == title ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selectedPayment == title ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddCardButton() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.black),
          SizedBox(width: 10),
          Text("Add Card", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildHistoryList() {
    final historyItems = [
      {"title": "Roller Rabbit", "subtitle": "Vado Odelle Dress", "price": "\$198.00"},
      {"title": "Axel Arigato", "subtitle": "Clean 90 Triple Sneakers", "price": "\$245.00"},
      {"title": "Herschel Supply Co.", "subtitle": "Daypack Backpack", "price": "\$40.00"},
    ];
    return ListView.builder(
      itemCount: historyItems.length,
      itemBuilder: (context, index) {
        final item = historyItems[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item["title"]!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(item["subtitle"]!, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
              Text(item["price"]!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }
}
