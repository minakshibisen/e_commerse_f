import 'package:flutter/material.dart';

import '../utils/colors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String image;
  final Size size;
  final IconData icon;

  const DefaultAppBar({super.key, this.title = '', required this.size, required this.image, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      toolbarHeight: size.height,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20,top:30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100], // Set background color
              borderRadius: BorderRadius.circular(25), // Match ClipRRect radius
            ),
            padding: const EdgeInsets.all(8), // Optional: Adjust padding for spacing
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(image, width: 35, height: 35, fit: BoxFit.cover,),
            ),
          )
        ),
      ],
      leadingWidth: size.width * .5,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child:  Padding(
          padding: const EdgeInsets.only(left: 20.0,top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child:  Icon(icon,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size.height * 0.09);
}
