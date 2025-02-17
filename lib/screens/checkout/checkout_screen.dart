import 'package:e_commerce_f/screens/checkout/payment_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 50), // Space for bottom bar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Delivery Address",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, size: 24),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildAddressSection(),
                  const SizedBox(height: 20),
                  const Text(
                    "Product Item",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildProductItem("assets/images/img.png", "Roller Rabbit", "Vado Odelle Dress", 198.00),
                  _buildProductItem("assets/images/img_1.png", "Roller Rabbit", "Vado Odelle Dress", 198.00),
                  const SizedBox(height: 20),

                  const Text(
                    "Promo Code",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildPromoCodeSection(),

                  const SizedBox(height: 20),
                  _buildPriceSection(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: _buildTotalPriceSection(context),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAddressRow("Street:", "3512 Pearl Street"),
          _buildAddressRow("City:", "Nagercoil"),
          _buildAddressRow("State/province/area:", "Tamil Nadu"),
          _buildAddressRow("Phone number:", "8870523416"),
          _buildAddressRow("Zip code:", "95814"),
          _buildAddressRow("Country calling code:", "+91"),
          _buildAddressRow("Country:", "India"),
        ],
      ),
    );
  }

  Widget _buildPriceSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPriceRow("SubTotal:", "3512"),
          _buildPriceRow("Shipping:", "17"),
          _buildPriceRow("BegTotal:", "435"),
        ],
      ),
    );
  }

  Widget _buildProductItem(String imagePath, String title, String subtitle, double price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 2)],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.cover),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 5),
              Text("\$${price.toStringAsFixed(2)}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCodeSection() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 2)],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.discount, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Promo Code", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("#rika2021", style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPriceSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 2)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              Text("Total Price", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("\$443.00", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            ],
          ),
          const SizedBox(width: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              minimumSize: const Size(150, 50),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const PaymentScreen()));
            },
            child: const Text("Place Order", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _buildAddressRow extends StatelessWidget {
  final String title;
  final String value;
  const _buildAddressRow(this.title, this.value, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: RichText(
        text: TextSpan(
          text: "$title ",
          style: const TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _buildPriceRow extends StatelessWidget {
  final String title;
  final String value;
  const _buildPriceRow(this.title, this.value, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.black)),
          Text(value, style:  TextStyle(fontSize: 14, color: Colors.grey[600])),
        ],
      ),
    );
  }
}

