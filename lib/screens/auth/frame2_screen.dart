import 'package:e_commerse_f/common/primary_button.dart';
import 'package:e_commerse_f/screens/auth/login_screen.dart';
import 'package:e_commerse_f/screens/auth/sign_in_screen.dart';
import 'package:e_commerse_f/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';

class Frame2Screen extends StatefulWidget {
  const Frame2Screen({super.key});

  @override
  State<Frame2Screen> createState() => _Frame2ScreenState();
}

class _Frame2ScreenState extends State<Frame2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_screen.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                    },
                    text: 'Sign Up',
                    color: Colors.white,
                    textColor: Colors.black,
                    borderColor: Colors.white,
                    context: context,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
