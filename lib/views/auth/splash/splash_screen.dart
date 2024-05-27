import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:miniso/views/auth/on_boarding/on_boarding.dart';




class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(

        child:Lottie.asset(
          'assets/animation/SplashLottie.json',

        ),
      ),
      nextScreen:const OnBoardingScreen(),
      duration: 3800,
      backgroundColor: Colors.white,
      splashIconSize:3000 ,
    );
  }
}
