import 'dart:developer';
import 'package:code_initial/presentation/pages/register/register_page.dart';
import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_page.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_controller.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
    ),
      GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingPage(),
      binding: OnboardingBinding(),
    )

  ];
}


class Routes {
  static Future<String> get initialRoute async {

      return ONBOARDING;
  }

  static const String MAIN = "/";

  static const REGISTER = '/register';
  static const ONBOARDING = '/onboarding';


}
