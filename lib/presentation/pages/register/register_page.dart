import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'onboarding_login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = false;
  String passwordStrength = '';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final box = GetStorage();

  void checkPasswordStrength(String password) {
    if (password.isEmpty) {
      passwordStrength = '';
    } else if (password.length < 6) {
      passwordStrength = 'Faible';
    } else if (password.length < 10) {
      passwordStrength = 'Moyen';
    } else {
      passwordStrength = 'Fort';
    }
    setState(() {});
  }

  void createAccount() {
    if (nameController.text.isEmpty ||
        mobileController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    // Sauvegarde locale (simulation)
    box.write('name', nameController.text);
    box.write('mobile', mobileController.text);
    box.write('password', passwordController.text);

    // 👉 FLAG POUR MESSAGE SUR LOGIN
    box.write('justRegistered', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
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
                  "Créer un compte",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: nameController,
                decoration: _inputDecoration("Nom", chocolate),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration("Mobile", chocolate),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: passwordController,
                obscureText: !passwordVisible,
                onChanged: checkPasswordStrength,
                decoration: _inputDecoration("Mot de passe", chocolate).copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() => passwordVisible = !passwordVisible);
                    },
                  ),
                ),
              ),

              if (passwordStrength.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    "Force : $passwordStrength",
                    style: TextStyle(
                      color: passwordStrength == 'Faible'
                          ? Colors.red
                          : passwordStrength == 'Moyen'
                              ? Colors.orange
                              : Colors.green,
                    ),
                  ),
                ),

              const SizedBox(height: 24),

              // Bouton "Créer un compte" 
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: chocolate,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: createAccount,
                  child: const Text(
                    "Créer un compte",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // S'inscrire avec google
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  icon: Image.asset("assets/images/google.png", height: 22),
                  label: const Text(
                    "S'inscrire avec Google",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: chocolate, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () async {
                    final user = await GoogleSignIn().signIn();
                    if (user != null) {
                      box.write('justRegistered', true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    }
                  },
                ),
              ),

              const SizedBox(height: 12),

              // S'inscrire avec Apple
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.apple, color: Colors.black),
                  label: const Text(
                    "S'inscrire avec Apple",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: chocolate, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Apple Sign-In disponible uniquement sur iOS",
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Vous avez déjà un compte ? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    child: const Text("Se connecter",
                    style: TextStyle(color: Color(0xFFC98435)), ),
                    
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, Color color) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: color),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: color, width: 2),
      ),
    );
  }
}
