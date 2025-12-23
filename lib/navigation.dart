import 'package:code_initial/presentation/pages/register/register_page.dart';
import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_page.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_controller.dart';
import 'package:code_initial/presentation/pages/register/password_forget_password.dart';
import 'package:code_initial/presentation/pages/product/product_page.dart';
import 'package:code_initial/presentation/pages/profile/profile_page.dart';
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
    ),
    GetPage(
     name: '/password-forget',
     page: () => const PasswordForgetPage(),
  ),
     GetPage(
      name: Routes.PRODUCT,
      page: () => ProductPage(
        productName: Get.arguments?['productName'],
        productPrice: Get.arguments?['productPrice'],
        productImage: Get.arguments?['productImage'],
        productImages: (Get.arguments?['productImages'] as List?)
            ?.cast<String>(),
      ),
    ),
    GetPage(name: Routes.PROFILE, page: () => ProfilePage()),
  ];
}


class Routes {
  static Future<String> get initialRoute async {

      return ONBOARDING;
  }

  static const String MAIN = "/";

  static const REGISTER = '/register';
  static const ONBOARDING = '/onboarding';
 static const PRODUCT = '/product';
  static const PROFILE = '/profile';

}
