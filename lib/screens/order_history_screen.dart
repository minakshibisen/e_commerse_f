import 'package:e_commerce_f/common/default_app_bar.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  bool isOngoingSelected = true;

  List<Map<String, dynamic>> orders = [
    {
      "image": "assets/images/img_1.png",
      "name": "Roller Rabbit",
      "description": "Vado Odelle Dress",
      "price": "\$198.00",
      "quality": "1",
      "size": "L",
      "color": Colors.grey[300],
    },
    {
      "image": "assets/images/img_3.png",
      "name": "Axel Arigato",
      "description": "Clean 90 Triole Sneakers",
      "price": "\$245.00",
      "quality": "1",
      "size": "41",
      "color": Colors.black,
    },
    {
      "image": "assets/images/img_4.png",
      "name": "Herschel Supply Co.",
      "description": "Daypack Backpack",
      "price": "\$40.00",
      "quality": "1",
      "size": "M",
      "color": Colors.grey,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(size: size, icon: Icons.arrow_back, actionIcon: Icons.shopping_bag),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(height: 30),
            const Text(
              'My Order',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Tab Bar
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTabButton("Ongoing", isOngoingSelected),
                const SizedBox(width: 10),
                _buildTabButton("Completed", !isOngoingSelected),
              ],
            ),
            const SizedBox(height: 30),

            // Orders List
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return orderItemCard(
                    orders[index]["image"],
                    orders[index]["name"],
                    orders[index]["description"],
                    orders[index]["price"],
                    orders[index]["quality"],
                    orders[index]["size"],
                    orders[index]["color"],
                  );
                },
              ),
            ),
          ],
        ),
      ),


    );
  }

  Widget _buildTabButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOngoingSelected = text == "Ongoing";
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }


  Widget orderItemCard(String image, String name, String description, String price, String quality, String size, Color? color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, height: 80, width: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text("Quality: $quality", style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 10),
                      Text("Size: $size", style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 10),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black38),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
