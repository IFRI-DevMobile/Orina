import 'package:flutter/material.dart';
import '../register/register_page.dart';
import '../register/onboarding_login_page.dart';

// Couleurs
const Color chocolate = Color(0xFFC98434);
const Color lightGrey = Color(0xFFF2F2F2);

class IntroFlowPage extends StatefulWidget {
  const IntroFlowPage({super.key});

  @override
  State<IntroFlowPage> createState() => _IntroFlowPageState();
}

class _IntroFlowPageState extends State<IntroFlowPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<_IntroData> pages = [
    _IntroData(
      images: [
        "assets/images/intro3.png",
        "assets/images/intro5.png",
        "assets/images/intro4.png",
      ],
      title: "Produits de qualité",
      subtitle: "Des soins sûrs pour une peau éclatante",
    ),
    _IntroData(
      images: ["assets/images/gemini1.png"],
      title: "Achat facile",
      subtitle: "Commandez en quelques clics",
    ),
    _IntroData(
      images: ["assets/images/gemini2.png"],
      title: "Livraison rapide",
      subtitle: "Chez vous en toute sécurité",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const SizedBox(width: 60),

                  Expanded(
                    child: Center(
                      child: Image.asset(
                        "assets/images/logo_orina.png",
                        height: 60,
                      ),
                    ),
                  ),

                  if (currentPage < pages.length - 1)
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Passer",
                        style: TextStyle(
                          color: chocolate,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 60),
                ],
              ),
            ),

           
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => currentPage = i),
                itemBuilder: (_, i) {
                  return _IntroPageContent(
                    data: pages[i],
                    isFirstPage: i == 0,
                  );
                },
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (i) => _dot(i == currentPage),
                ),
              ),
            ),

           
            Container(
              color: lightGrey,
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: chocolate,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (currentPage < pages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut,
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterPage(),
                      ),
                    );
                  }
                },
                child: Text(
                  currentPage == pages.length - 1 ? "Commencer" : "Suivant",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 18 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? chocolate : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _IntroPageContent extends StatelessWidget {
  final _IntroData data;
  final bool isFirstPage;

  const _IntroPageContent({
    required this.data,
    required this.isFirstPage,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 30),

           //Images
            Column(
              children: List.generate(data.images.length, (i) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 24,
                    left: isFirstPage ? i * 20.0 : 0,
                  ),
                  child: SizedBox(
                    height: isFirstPage ? 200 : 260,
                    child: Image.asset(
                      data.images[i],
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              data.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroData {
  final List<String> images;
  final String title;
  final String subtitle;

  _IntroData({
    required this.images,
    required this.title,
    required this.subtitle,
  });
}
