import 'dart:async';
import 'package:code_initial/presentation/pages/onboarding/intro_orina.dart';
import 'package:flutter/material.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;
  late Animation<double> _fadeLogo;
  late Animation<double> _scaleLogo;
  late Animation<double> _fadeText;

  @override
  void initState() {
    super.initState();

    // Animation 
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5500),
    );

    // Animation du scale (effet Blender)
    _scaleLogo = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.25)
            .chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.25, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
    ]).animate(_controller);

    // Fade du logo
    _fadeLogo = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Fade du texte
    _fadeText = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();

    //  Aller vers la page intro apres 8s
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const IntroFlowPage())
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        
        double logoSize = constraints.maxHeight * 0.28;
        double fontSize = constraints.maxHeight * 0.035;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //  Logo animé
                  FadeTransition(
                    opacity: _fadeLogo,
                    child: ScaleTransition(
                      scale: _scaleLogo,
                      child: Image.asset(
                        'assets/images/logo_orina.png',
                        height: logoSize,
                      ),
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * 0.06),

                  //  Texte animé
                  FadeTransition(
                    opacity: _fadeText,
                    child: Text(
                      'La douceur qui vous sublime.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
