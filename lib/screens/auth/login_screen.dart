import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../component/curved-left.dart';
import '../../component/curved-right-shadow.dart';
import '../../component/curved-right.dart';
import '../../component/curver_left_shadow.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Screen size
    double paddingHorizontal = size.width * 0.08; // Responsive horizontal padding

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(top: 0, left: 0, child: FadeInUp(delay: const Duration(seconds: 1), child: const CurvedLeftShadow())),
          Positioned(top: 0, left: 0, child: FadeInDown(delay: const Duration(seconds: 1), child: CurvedLeft())),
          Positioned(bottom: 0, left: 0, child: FadeInDown(delay: const Duration(seconds: 1), child: CurvedRightShadow())),
          Positioned(bottom: 0, left: 0, child: FadeInUp(delay: const Duration(seconds: 1), child: CurvedRight())),
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0), // Reduced for smaller screens
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700), // Adjusted font size
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingHorizontal), // Responsive padding
                  child: Stack(
                    children: <Widget>[
                      FadeInLeft(
                        delay: const Duration(seconds: 2),
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          margin: EdgeInsets.only(right: size.width * 0.15), // Adjusted margin
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(90), // More responsive border
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                style: const TextStyle(fontSize: 18.0),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                                  icon: Icon(Icons.person_outline, size: 22.0),
                                  hintText: "Username",
                                  border: InputBorder.none,
                                ),
                              ),
                              Divider(color: Colors.grey[300]),
                              TextFormField(
                                style: const TextStyle(fontSize: 18.0),
                                obscureText: true,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                                  icon: Icon(Icons.lock_outline, size: 22.0),
                                  hintText: "Password",
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.05, // Responsive positioning
                        right: size.width * 0.05, // Responsive positioning
                        child: FadeInDown(
                          delay: const Duration(seconds: 1),
                          child: GestureDetector(
                            onTap: () {
                              // Handle login action
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromRGBO(94, 201, 202, 1.0),
                                    Color.fromRGBO(119, 235, 159, 1.0),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.0,
                                  )
                                ],
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                size: 30.0, // Slightly smaller for better fit
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                  child: Text(
                    "Forgot?",
                    style: TextStyle(
                      fontSize: 20.0, // Reduced for smaller screens
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "register");
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
