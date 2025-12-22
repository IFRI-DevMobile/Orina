import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PasswordForgetPage extends StatefulWidget {
  const PasswordForgetPage({super.key});

  @override
  State<PasswordForgetPage> createState() => _PasswordForgetPageState();
}

class _PasswordForgetPageState extends State<PasswordForgetPage> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  final Color backgroundColor = const Color(0xFFF2F2F2);
  final Color chocolate = const Color(0xFFC98435);

  Future<void> resetPassword() async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez entrer votre email")),
      );
      return;
    }

    try {
      setState(() => isLoading = true);

      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Un email de réinitialisation a été envoyé",
          ),
        ),
      );

      // Retour à la page précédente (login)
      Get.back();
    } on FirebaseAuthException catch (e) {
      String message = "Une erreur est survenue";

      if (e.code == 'user-not-found') {
        message = "Aucun utilisateur trouvé avec cet email";
      } else if (e.code == 'invalid-email') {
        message = "Adresse email invalide";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Text(
              "Mot de passe oublié ?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Veuillez saisir votre adresse email. "
              "Nous vous enverrons les instructions pour réinitialiser votre mot de passe.",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            // Champ email
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Email",
                hintText: "exemple@email.com",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: chocolate),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: chocolate, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Bouton reset
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
                onPressed: isLoading ? null : resetPassword,
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : const Text(
                        "Réinitialiser le mot de passe",
                        style: TextStyle(color: Colors.black),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
