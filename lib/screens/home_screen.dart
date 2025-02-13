import 'package:e_commerse_f/common/default_app_bar.dart';
import 'package:e_commerse_f/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(size: size, image: 'assets/images/dummy.png', icon: Icons.menu_open),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryChip('Dresses', true),
                    categoryChip('Jackets', false),
                    categoryChip('Jeans', false),
                    categoryChip('Shoes', false),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Top Dresses',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('View All',style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 230,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      dressItem('assets/images/img.png', 'Roller Rabbit'),
                      dressItem('assets/images/img_2.png', 'Endless Rose'),
                      dressItem('assets/images/img_1.png', 'Endless Rose'),
                      dressItem('assets/images/img_3.png', 'Endless Rose'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryChip(String title, bool isSelected) {
    return Container(
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
    );
  }

  Widget dressItem(String imagePath, String name) {
    return Container(
      width: 190,
      margin:  EdgeInsets.only(right:5),
      child: GestureDetector(
        onTap: (){
        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ProductDetailsScreen()));
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
                    child: Icon(Icons.favorite_border,color: Colors.white,),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold,),maxLines: 2,),
          ],
        ),
      ),
    );
  }
}
