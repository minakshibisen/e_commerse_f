import 'package:e_commerse_f/common/primary_button.dart';
import 'package:e_commerse_f/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              const SizedBox(height: 40),
              const Text(
                'Fashions',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                ),
              ),
              const Text(
                'My Life My Style',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                ),
              ),
              const SizedBox(height: 40),
          
              // Welcome Text
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please login or sign up to continue our app',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 30),
          
              // Email Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30),
          
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: const Icon(Icons.check_circle_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 40),
          
              PrimaryButton(
                onPressed: () {},
                context: context,
                text: "Login",
                textColor: Colors.white,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
          
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),
          
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(color: Colors.grey),
                ),
                onPressed: () {},
                icon:
                    const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                label: const Text(
                  'Continue with Facebook',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(color: Colors.grey),
                ),
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.google, color: Colors.black),
                label: const Text(
                  'Continue with Google',
                  style: TextStyle(color: Colors.black),
                ),
              ),
          
              const SizedBox(height: 20),
          
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(color: Colors.grey),
                ),
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.apple, color: Colors.black),
                label: const Text(
                  'Continue with Apple',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
