import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final String labeltext;

  const TextField({
    required this.labeltext,
    super.key, required InputDecoration decoration,
   
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          labeltext: labeltext,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),


    ), );
  }

}