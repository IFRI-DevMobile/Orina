import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/navigation.dart';
import 'package:pinput/pinput.dart';

class OnboardingPageModel {
  final String title;
  final String description;
  final IconData icon;
  final Color textColor;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.icon,
    this.textColor = Colors.white,
  });
}

class OnboardingScreen extends StatefulWidget {
  final List<OnboardingPageModel> pages;

  const OnboardingScreen({super.key, required this.pages});

  @override
  State<OnboardingScreen> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.pages.length,
                onPageChanged: (idx) {
                  setState(() {
                    _currentPage = idx;
                  });
                },
                itemBuilder: (context, idx) {
                  final item = widget.pages[idx];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                item.icon,
                                size: 200,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                          ),
                        ),
                        const SizedBox(height: 20),
                        Pinput(
                          length: 4,
                          separatorBuilder: (index) => const SizedBox(width: 8),
                          validator: (value) {
                            return value == '2222' ? null : 'Pin is incorrect';
                          },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.04),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  item.title.toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 22,
                                    color: Colors.pink,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.1,
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  item.description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: Get.height * 0.07,
              width: Get.width * 0.9,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: const Center(
                      child: Text(
                        "Connexion",
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.pages
                        .asMap()
                        .entries
                        .map((entry) => AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              width: _currentPage == entry.key ? 35 : 10,
                              height: 10,
                              margin: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                color: _currentPage == entry.key
                                    ? Colors.orange
                                    : Colors.orange.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ))
                        .toList(),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_currentPage == widget.pages.length - 1) {
                        Get.toNamed(Routes.REGISTER);
                      } else {
                        _pageController.animateToPage(
                          _currentPage + 1,
                          curve: Curves.easeInOutCubic,
                          duration: const Duration(milliseconds: 250),
                        );
                      }
                    },
                    child: const Center(
                      child: Text(
                        "Suivant",
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.03),
          ],
        ),
      ),
    );
  }
}
