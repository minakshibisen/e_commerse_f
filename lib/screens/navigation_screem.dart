import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:e_commerce_f/screens/detail_screen.dart';
import 'package:e_commerce_f/screens/notification_screen.dart';
import 'package:e_commerce_f/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'home_screen.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const ProductDetailsScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        height: 80,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined, color: Colors.white, size: 30),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_cart_outlined,
                color: Colors.white, size: 30),
            label: 'Cart',
          ),
          CurvedNavigationBarItem(
            child:
                Icon(Icons.notifications_none, color: Colors.white, size: 30),
            label: 'Notification',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.person_outline, color: Colors.white, size: 30),
            label: 'Profile',
          ),
        ],
        index: currentIndex,

        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartScreen()));
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
