import 'dart:developer';
import 'package:code_initial/presentation/pages/register/register_page.dart';
import 'package:get/get.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
    ),

  ];
}


class Routes {
  static Future<String> get initialRoute async {

      return REGISTER;
  }

  static const String MAIN = "/";

  static const REGISTER = '/register';

}
