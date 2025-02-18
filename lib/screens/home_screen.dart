import 'package:e_commerce_f/common/default_app_bar.dart';
import 'package:e_commerce_f/screens/favorite_screen.dart';
import 'package:e_commerce_f/screens/order_history_screen.dart';
import 'package:e_commerce_f/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "Dresses";
  final List<Map<String, String>> categoriess = [
    {
      "image": "assets/images/img_7.png",
      "title": "New Arrivals",
      "count": "208 Product"
    },
    {
      "image": "assets/images/img_1.png",
      "title": "Clothes",
      "count": "358 Product"
    },
    {
      "image": "assets/images/img_6.png",
      "title": "Bags",
      "count": "160 Product"
    },
    {
      "image": "assets/images/img_3.png",
      "title": "Shoes",
      "count": "230 Product"
    },
    {
      "image": "assets/images/img_3.png",
      "title": "Electronics",
      "count": "130 Product"
    },
    {
      "image": "assets/images/img_1.png",
      "title": "Jewelry",
      "count": "87 Product"
    },
  ];

  void onCategoryTap(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  final List<Map<String, String>> offers = [
    {
      "discount": "50% Off",
      "image": "assets/images/img_1.png",
      "code": "Fscreation"
    },
    {
      "discount": "70% Off",
      "image": "assets/images/img_2.png",
      "code": "Fscreation"
    },
    {
      "discount": "50% Off",
      "image": "assets/images/img_3.png",
      "code": "Fscreation"
    },
    {
      "discount": "75% Off",
      "image": "assets/images/img.png",
      "code": "Fscreation"
    },
  ];
  final Map<String, List<Map<String, String>>> categoryItems = {
    "Dresses": [
      {"image": "assets/images/img.png", "name": "Roller Rabbit"},
      {"image": "assets/images/img_2.png", "name": "Endless Rose"},
      {"image": "assets/images/img_1.png", "name": "Endless Rose"},
      {"image": "assets/images/img_3.png", "name": "Endless Rose"},
    ],
    "Shoes": [
      {"image": "assets/images/img_3.png", "name": "Nike Air Max"},
      {"image": "assets/images/img_3.png", "name": "Adidas UltraBoost"},
      {"image": "assets/images/img_3.png", "name": "Puma Classic"},
      {"image": "assets/images/img_3.png", "name": "Reebok Runner"},
    ],
    "Jackets": [
      {"image": "assets/images/img_2.png", "name": "Leather Jacket"},
      {"image": "assets/images/img_2.png", "name": "Denim Jacket"},
    ],
    "Jeans": [
      {"image": "assets/images/img_5.png", "name": "Slim Fit Jeans"},
      {"image": "assets/images/img_5.png", "name": "Ripped Jeans"},
    ]
  };
  final List<String> categories = ["Dresses", "Jackets", "Jeans", "Shoes"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 250,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child:
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child:
                      const Icon(Icons.tune_rounded, color: Colors.black,),
                    ),
                    SizedBox(height: 20,),
                    const Text(
                      'Minkashi Bisen',
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ProfileScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Order '),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyOrderScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Offers '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' My Favorite'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const FavoriteScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.menu_open_rounded, color: Colors.white),
                          onPressed: () {
                            Scaffold.of(context).openDrawer(); // Opens the drawer
                          },
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                        icon: const Icon(Icons.shopping_bag_outlined,
                            color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Welcome,',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Our Fashions App',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
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
                const SizedBox(height: 40),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                            height: 100,
                            child: Image(
                              image: AssetImage('assets/images/img_3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Axel Arigato',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                'Clean 90 Triple Sneakers',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                                maxLines: 2,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '\$245.00',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.navigate_next,
                              color: Colors.white, size: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: categories.map((category) {
                      return categoryChip(
                          category, selectedCategory == category, () {
                        onCategoryTap(category);
                      });
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top $selectedCategory',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Dynamic Items List
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: (categoryItems[selectedCategory] ?? [])
                        .map((item) => dressItem(
                            item["image"] ?? "", item["name"] ?? "", context))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'For You',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      final category = categoriess[index];
                      return CategoryCard(
                        imagePath: category["image"]!,
                        title: category["title"]!,
                        productCount: category["count"]!,
                        onTap: () {
                          // Handle category click
                          print("Clicked on ${category["title"]}");
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Discount Offer ',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                SizedBox(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: offers.length,
                    itemBuilder: (context, index) {
                      final offer = offers[index];
                      return DiscountCard(
                        discountText: offer["discount"]!,
                        imagePath: offer["image"]!,
                        code: offer["code"]!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget categoryChip(String title, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    ),
  );
}

Widget dressItem(String imagePath, String name, BuildContext context) {
  return Container(
    width: 190,
    margin: const EdgeInsets.only(right: 5),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ProductDetailsScreen(),
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imagePath,
                    width: 170, height: 190, fit: BoxFit.cover),
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
          const SizedBox(height: 5),
          Text(name,
              style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2),
        ],
      ),
    ),
  );
}

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String productCount;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.productCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(imagePath,
                    width: double.infinity, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(productCount,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscountCard extends StatelessWidget {
  final String discountText;
  final String imagePath;
  final String code;

  const DiscountCard({
    super.key,
    required this.discountText,
    required this.imagePath,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Overlay with discount details
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black
                  .withOpacity(0.4), // Dark overlay for better text visibility
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  discountText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "On everything today",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 3),
                Text(
                  "With code: $code",
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Get Now",
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
