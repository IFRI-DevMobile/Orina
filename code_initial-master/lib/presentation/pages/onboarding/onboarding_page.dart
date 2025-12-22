import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'onboarding_controller.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_page_model.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: OnboardingScreen(
        pages: [
          OnboardingPageModel(
            title: 'Votre repas a proximite',
            description: "Explorez une variété de restaurants locaux et trouvez des repas délicieux près de chez vous.",
            icon: Icons.group_add
          ),
          OnboardingPageModel(
            title: 'Commandez vos repas',
            description: "Découvrez et commandez des repas délicieux auprès de vos restaurants préférés en quelques clics.",
            icon: Icons.event_available,
          ),
          OnboardingPageModel(
            title: 'Faites-vous livrer',
            description: "Recevez vos plats rapidement et facilement à l'endroit de votre choix grâce à notre service de livraison efficace.",
            icon: Icons.self_improvement,
          ),
        ],
      )),
    );
  }
}
