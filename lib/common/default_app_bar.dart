import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Size size;
  final IconData icon;
  final IconData actionIcon; // 🔹 New parameter for action icon

  const DefaultAppBar({
    super.key,
    this.title = '',
    required this.size,
    required this.icon,
    required this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      toolbarHeight: size.height,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 30),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              icon: Icon(actionIcon, color: Colors.white, size: 24),
              onPressed: () {
              },
            ),
          ),
        ),
      ],
      leadingWidth: size.width * .25,
      leading: Padding(
        padding: const EdgeInsets.only(left: 0.0, top: 30),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              icon: Icon(icon, color: Colors.white),
              onPressed: () => Navigator.pop(context), // ✅ Ensure back navigation
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size.height * 0.09);
}
