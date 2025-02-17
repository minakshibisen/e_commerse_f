import 'package:e_commerce_f/common/default_app_bar.dart';
import 'package:e_commerce_f/screens/order_history_screen.dart';
import 'package:e_commerce_f/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
          size: size,
          icon: Icons.arrow_back_sharp,
          actionIcon: Icons.shopping_bag_outlined),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Card
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: Colors.grey[100],
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image(
                            image: AssetImage('assets/images/splash_screen.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Minakshi Bisen',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'minakshibisen@gmail.com',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: _buildMenuSection([
                _buildMenuItem(Icons.person, "Personal Details", () {}),
                _buildMenuItem(Icons.shopping_bag, "My Order", () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyOrderScreen()));
                }),
                _buildMenuItem(Icons.favorite_border, "My Favourites", () {}),
                _buildMenuItem(Icons.local_shipping, "Shipping Address", () {}),
                _buildMenuItem(Icons.credit_card, "My Card", () {}),
                _buildMenuItem(Icons.settings, "Settings", () {}),
              ]),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: _buildMenuSection([
                _buildMenuItem(Icons.question_answer_outlined, "FAQ's", () {}),
                _buildMenuItem(Icons.privacy_tip_outlined, "Privacy Policy", () {}),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(List<Widget> items) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.grey), // Fixed Color Reference
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(children: items),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      onTap: onTap,
    );
  }
}
