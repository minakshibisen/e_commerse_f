import 'package:e_commerce_f/screens/auth/start_shopping_screen.dart';
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
    Size size = MediaQuery.of(context).size;
    double textScale = MediaQuery.textScalerOf(context).scale(1.0); // Text scaling

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07), // Responsive padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              SizedBox(height: size.height * 0.08),
              Text(
                'Fashions',
                style: TextStyle(
                  fontSize: 50 * textScale,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                ),
              ),
              Text(
                'My Life My Style',
                style: TextStyle(
                  fontSize: 12 * textScale,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                ),
              ),
              SizedBox(height: size.height * 0.05),

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
              SizedBox(height: size.height * 0.04),

              InputFieldWidget(
                  hintText: 'User Name',
                  icon: Icons.person,
                  textInputAction: TextInputAction.next,
                  controller: usernameController),
              SizedBox(height: size.height * 0.02),

              InputFieldWidget(
                  hintText: 'Password',
                  icon: Icons.password,
                  textInputAction: TextInputAction.done,
                  controller: passwordController),
              SizedBox(height: size.height * 0.04),

              PrimaryButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StartShoppingScreen()));
                },
                context: context,
                text: "Login",
                textColor: Colors.white,
                color: Colors.black,
              ),
              SizedBox(height: size.height * 0.02),

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
              SizedBox(height: size.height * 0.02),

              _buildSocialButton(
                context,
                icon: FontAwesomeIcons.facebook,
                text: 'Continue with Facebook',
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
              ),
              SizedBox(height: size.height * 0.02),

              _buildSocialButton(
                context,
                icon: FontAwesomeIcons.google,
                text: 'Continue with Google',
                backgroundColor: Colors.white,
                textColor: Colors.black,
              ),
              SizedBox(height: size.height * 0.02),

              _buildSocialButton(
                context,
                icon: FontAwesomeIcons.apple,
                text: 'Continue with Apple',
                backgroundColor: Colors.white,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context,
      {required IconData icon,
        required String text,
        required Color backgroundColor,
        required Color textColor}) {
    Size size = MediaQuery.of(context).size;
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(size.width * 0.85, 50), // Responsive width
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: const BorderSide(color: Colors.grey),
      ),
      onPressed: () {},
      icon: FaIcon(icon, color: textColor),
      label: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
