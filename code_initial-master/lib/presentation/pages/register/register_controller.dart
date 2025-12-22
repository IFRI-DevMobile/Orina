import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/domain/models/user.dart';

class RegisterController extends GetxController {

  RegisterController();

  final fullnameController = TextEditingController();

  // User list data
  final RxList<User> users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  void loadUsers() {
    users.assignAll([
      User(
        id: '1',
        name: 'Aada Laine',
        email: 'aada.laine@example.com',
        avatar: '👨',
        isOnline: true,
        lastSeen: '6/28/2021',
      ),
      User(
        id: '2',
        name: 'Brown Kid',
        email: 'brown.kid@example.com',
        avatar: '🎓',
        isOnline: false,
        lastSeen: '6/27/2021',
      ),
      User(
        id: '3',
        name: 'Adelle Charles',
        email: 'adelle.charles@example.com',
        avatar: '👩',
        isOnline: true,
        lastSeen: '6/26/2021',
      ),
      User(
        id: '4',
        name: 'Salvatore',
        email: 'salvatore@example.com',
        avatar: '👥',
        isOnline: false,
        lastSeen: '6/25/2021',
      ),
      User(
        id: '5',
        name: 'Vishal',
        email: 'vishal@example.com',
        avatar: 'V',
        isOnline: true,
        lastSeen: '6/24/2021',
        avatarColor: Colors.green,
      ),
      User(
        id: '6',
        name: 'Abdullah Hadley',
        email: 'abdullah.hadley@example.com',
        avatar: '👨',
        isOnline: false,
        lastSeen: '6/24/2021',
      ),
      User(
        id: '7',
        name: 'Loki Bright',
        email: 'loki.bright@example.com',
        avatar: '👤',
        isOnline: true,
        lastSeen: '6/22/2021',
      ),
      User(
        id: '8',
        name: 'Ana De Armas',
        email: 'ana.dearmas@example.com',
        avatar: '👩',
        isOnline: false,
        lastSeen: '6/22/2021',
      ),
      User(
        id: '9',
        name: 'Mario Palmer',
        email: 'mario.palmer@example.com',
        avatar: '👨',
        isOnline: true,
        lastSeen: '6/14/2021',
      ),
    ]);
  }

  /// === VALIDATIONS === ///
  String? validateEmail(String? value) {
    if (!GetUtils.isEmail(value!)) {
      return "Email invalide";
    }
    return null;
  }

  /// === ACTIONS === ///
  Future<void> signUp() async {

  }

  void onUserTap(User user) {
    Get.snackbar(
      'User Selected',
      'Selected: ${user.name}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
