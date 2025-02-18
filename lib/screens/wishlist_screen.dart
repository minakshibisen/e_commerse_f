import 'package:e_commerce_f/common/default_app_bar.dart';
import 'package:e_commerce_f/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Map<String, dynamic>> wishlistItems = [
    {
      "image": "assets/images/img_1.png",
      "title": "Roller Rabbit",
      "subtitle": "Vado Odelle Dress",
      "price": "\$198.00"
    },
    {
      "image": "assets/images/img_2.png",
      "title": "Axel Arigato",
      "subtitle": "Clean 90 Triple Sneakers",
      "price": "\$245.00"
    },
    {
      "image": "assets/images/img_3.png",
      "title": "Herschel Supply Co.",
      "subtitle": "Daypack Backpack",
      "price": "\$40.00"
    },
    {
      "image": "assets/images/img_4.png",
      "title": "Soludos",
      "subtitle": "Ibiza Classic Lace Sneakers",
      "price": "\$120.00"
    },
    {
      "image": "assets/images/img.png",
      "title": "On Ear Headphone",
      "subtitle": "Beats Solo3 Wireless Kulak",
      "price": "\$50.00"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(size: size, icon: Icons.arrow_back, actionIcon: Icons.shopping_bag),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child:
                  const Icon(Icons.tune_rounded, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Wishlist",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: wishlistItems.length,
                itemBuilder: (context, index) {
                  final item = wishlistItems[index];
                  return _buildWishlistItem(
                    item["image"],
                    item["title"],
                    item["subtitle"],
                    item["price"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildWishlistItem(String image, String title, String subtitle, String price) {
    return Card(
      color: Colors.grey[100],
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, width: 70, height: 70, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  const SizedBox(height: 5),
                  Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CartScreen()));
              },
              child: const Text("Add to cart", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
