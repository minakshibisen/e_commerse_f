import 'package:e_commerse_f/screens/auth/start_shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/input_field.dart';
import '../../common/primary_button.dart';
import '../../utils/colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              const SizedBox(height: 70),
              const Text(
                'Fashions',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                ),
              ),
              const Text(
                'My Life My Style',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                ),
              ),
              const SizedBox(height: 50),

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
              const SizedBox(height: 50),

              InputFieldWidget(
                  hintText: 'User Name',
                  icon: Icons.person,
                  textInputAction: TextInputAction.next,
                  controller: usernameController),
              const SizedBox(
                height: 20,
              ),

              InputFieldWidget(
                  hintText: 'Password',
                  icon: Icons.password,
                  textInputAction: TextInputAction.next,
                  controller: passwordController),
              const SizedBox(height: 40),

              PrimaryButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const StartShoppingScreen() ));
                },
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
