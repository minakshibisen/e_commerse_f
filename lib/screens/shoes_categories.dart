import 'package:e_commerce_f/common/default_app_bar.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';

class ShoesCategories extends StatefulWidget {
  const ShoesCategories({super.key});

  @override
  State<ShoesCategories> createState() => _ShoesCategoriesState();
}

class _ShoesCategoriesState extends State<ShoesCategories> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> shoesList = [
      {'image': 'assets/images/img.png', 'name': 'Roller Rabbit','description':'Vado Odelle Dress','price':'500'},
      {'image': 'assets/images/img_1.png', 'name': 'Nike Air Max','description':'Vado Odelle Dress','price':'500'},
      {'image': 'assets/images/img_2.png', 'name': 'Adidas Superstar','description':'Vado Odelle Dress','price':'500'},
      {'image': 'assets/images/img_3.png', 'name': 'Puma RS-X','description':'Vado Odelle Dress','price':'500'},
      {'image': 'assets/images/img_3.png', 'name': 'New Balance 574','description':'Vado Odelle Dress','price':'500'},
      {'image': 'assets/images/img.png', 'name': 'Vans Old Skool','description':'Vado Odelle Dress','price':'500'},
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(size: size, icon: Icons.arrow_back_sharp, actionIcon: Icons.shopping_bag_outlined),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 25),
        child: GridView.builder(
          itemCount: shoesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 0,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return dressItem(
              shoesList[index]['image']!,
              shoesList[index]['name']!,
              shoesList[index]['price']!,
              shoesList[index]['description']!,
              context,
            );
          },
        ),
      ),
    );
  }
}
Widget dressItem(String imagePath, String name, String price ,String description ,BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ProductDetailsScreen(),
      ));
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 140,
                fit: BoxFit.fill,
              ),
            ),
            const Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          description,
          style: const TextStyle(fontWeight: FontWeight.normal,color: Colors.grey, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          price,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}