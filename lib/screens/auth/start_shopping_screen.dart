import 'package:e_commerce_f/common/primary_button.dart';
import 'package:e_commerce_f/screens/navigation_screem.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartShoppingScreen extends StatefulWidget {
  const StartShoppingScreen({super.key});

  @override
  State<StartShoppingScreen> createState() => _StartShoppingScreenState();
}

class _StartShoppingScreenState extends State<StartShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animation/success.json',
            width: 200,
            height: 200,
            repeat: false,
          ),
          const SizedBox(height: 50,),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Successfully',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10,),
           Align(
            alignment: Alignment.center,
            child: Text(
              'You have successfully registered in \n our app and start working in it.',
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PrimaryButton(
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NavigationExample()));},
              context: context,
              text: 'Start Shopping',
              color: Colors.black,
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
