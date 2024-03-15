import 'package:final_project/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: FutureBuilder(
        future: _delaySplash(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset(
                "assets/AMZjARZYCz.json",
                height: 400,
                width: 400,
              ),
            );
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MOTOPEDIA",
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontFamily: 'Anton'
                  ),
                ),
              ],
            );
          }
        },
      ),
      nextScreen: const OnboardingScreen(),
      splashIconSize: 400,
      duration: 6500,
      backgroundColor: Colors.green,
    );
  }

  Future<void> _delaySplash() async {
    await Future.delayed(const Duration(seconds: 5)); 
  }
}
