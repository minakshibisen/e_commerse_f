import 'package:e_commerse_f/component/shape_painter.dart';
import 'package:e_commerse_f/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Widget> _onboardingPages = [
    OnboardingPage(
      imagePath: 'assets/images/img.png',
      title: '20% Discount \nNew Arrival Product',
      description:
          'Publish up your selfies to make yourself more beautiful with this app.',
      bgColor: Colors.blue[100]!,
    ),
    OnboardingPage(
      imagePath: 'assets/images/img_1.png',
      title: 'Take Advantage of The\n Offer Shopping',
      description:
          'Publish up your selfies to make yourself more beautiful with this app.',
      bgColor: Colors.green[100]!,
    ),
    OnboardingPage(
      imagePath: 'assets/images/img_2.png',
      title: 'All Types Offer \n Withing Your Reach',
      description:
          'Publish up your selfies to make yourself more beautiful with this app.',
      bgColor: Colors.orange[100]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: _onboardingPages,
              ),
            ),
            _buildPageIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingPages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: _currentPage == index ? 24 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_currentPage < _onboardingPages.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                     const SignUpScreen(),
                  transitionDuration: const Duration(milliseconds: 1000),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 1.0),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      )),
                      child: child,
                    );
                  },
                ));
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.black,
            ),
            child: const Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Color bgColor;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(40.0),
            ),
            child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: 400,
                ),
                color: Colors.grey,
                child: Image.asset(
                  imagePath,
                  height: 400,
                  fit: BoxFit.fitWidth,
                )),
          ),*/
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
            child: ClipPath(
              clipper: const ShapePainter(0.15),
              child: Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(
                    maxWidth: double.infinity,
                    maxHeight: 400,
                  ),
                  color: Colors.grey,
                  child: Image.asset(
                    imagePath,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.fill ,
                  )),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 20),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:0,horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
