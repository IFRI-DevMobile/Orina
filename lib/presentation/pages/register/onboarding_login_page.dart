import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'register_page.dart';
import 'accueil_page.dart';
import 'package:code_initial/services/authentifaication_goo_app.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool passwordVisible = false;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final box = GetStorage();

  @override
  void initState() {
    super.initState();

    // Pré-remplir les champs si déjà sauvegardés
    phoneController.text = box.read('mobile') ?? '';
    passwordController.text = box.read('password') ?? '';

    // Vérifier si l'utilisateur vient de s'inscrire
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool? justRegistered = box.read('justRegistered');
      if (justRegistered == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Inscription réussie ! Connectez-vous.'),
            backgroundColor: Colors.green,
          ),
        );
        box.remove('justRegistered'); // Supprimer le flag
      }
    });
  }

  void login() {
    if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    if (phoneController.text != box.read('mobile') ||
        passwordController.text != box.read('password')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Numéro ou mot de passe incorrect')),
      );
      return;
    }

    box.write('isLogged', true);
    Get.offAll(() => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF2F2F2);
    const chocolate = Color(0xFFC98435);

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              Center(
                child: Image.asset(
                  'assets/images/logo_orina.png',
                  height: 80,
                ),
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  "Connectez-vous à votre compte",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Center(
                child: Text(
                  "Bon retour ! Veuillez entrer vos informations",
                  style: TextStyle(color: Colors.black54),
                ),
              ),

              const SizedBox(height: 30),

              // Champ numéro de téléphone
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration("Numéro de téléphone", chocolate),
              ),

              const SizedBox(height: 16),

              // Champ mot de passe
              TextField(
                controller: passwordController,
                obscureText: !passwordVisible,
                decoration: _inputDecoration(
                  "Mot de passe",
                  chocolate,
                  suffix: IconButton(
                    icon: Icon(
                      passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Checkbox "Se souvenir" et mot de passe oublié
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        activeColor: chocolate,
                        onChanged: (value) {
                          setState(() => rememberMe = value ?? false);
                        },
                      ),
                      const Text("Se souvenir"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/password-forget');
                    },
                    child: const Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(color: Color(0xFFC98435)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Bouton login
              _primaryButton(
                text: "Se connecter",
                icon: Icons.arrow_forward,
                color: chocolate,
                onPressed: login,
              ),

              const SizedBox(height: 16),

              // Bouton Gmail
              _outlinedButton(
                text: "Se connecter avec Gmail",
                image: 'assets/images/google.png',
                color: chocolate,
                onPressed: () async {
                  try {
                    final user = await AuthService().signInWithGoogle();
                    if (user != null) {
                      box.write('isLogged', true);
                      Get.offAll(() => const HomePage());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Connexion Google annulée ou échouée"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Erreur Google : $e"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 24),

              // Lien vers la page d'inscription
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Vous n'avez pas de compte ? "),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const RegisterPage());
                    },
                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(color: Color(0xFFC98435)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// InputDecoration pour les TextField
InputDecoration _inputDecoration(String label, Color color,
    {Widget? suffix}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelText: label,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: color, width: 2),
    ),
    suffixIcon: suffix,
  );
}

// Bouton principal
Widget _primaryButton({
  required String text,
  required IconData icon,
  required Color color,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: const TextStyle(color: Colors.black)),
          const SizedBox(width: 8),
          Icon(icon, color: Colors.black),
        ],
      ),
    ),
  );
}

// Bouton Gmail/Google
Widget _outlinedButton({
  required String text,
  required String image,
  required Color color,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: OutlinedButton.icon(
      icon: Image.asset(image, height: 24),
      label: Text(text, style: const TextStyle(color: Colors.black)),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: onPressed,
    ),
  );
}
