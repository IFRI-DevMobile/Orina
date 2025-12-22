import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_page.dart';

class SplashScreen2Page extends GetView {
  const SplashScreen2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded( // Permet à FlutterSplashScreen de prendre tout l'espace restant
              child: FlutterSplashScreen.fadeIn(
                backgroundColor: Colors.white,
                onInit: () {
                  debugPrint("On Init");
                },
                onEnd: () {
                  debugPrint("On End");
                },
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flutter_dash, size: 100),
                    SizedBox(height: Get.width * 0.15,),
                    Icon(Icons.code, size: 100),
                  ],
                ),
                onAnimationEnd: () => debugPrint("On Fade In End"),
                nextScreen: const OnboardingPage(),
                duration: Duration(seconds: 2),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Icon(Icons.keyboard_arrow_down, size: 50,),
            ),
          ],
        ),
      ),
    );

  }
}