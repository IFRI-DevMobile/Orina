import 'package:flutter/material.dart';
import 'confirmation_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Caisse",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.favorite_border, color: Colors.black),
          )
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// Adresse de livraison
          _infoCard(
            title: "Adresse de livraison",
            content: "Akpakpa; dodome",
          ),

          const SizedBox(height: 12),

          /// Contact
          _infoCard(
            title: "Contact Information",
            content: "+225901045902391\namandamorgan@example.com",
          ),

          const SizedBox(height: 20),

          /// Articles + coupon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Articles  2",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.confirmation_number_outlined),
                label: const Text("Ajouter un bon"),
              )
            ],
          ),

          const SizedBox(height: 10),

          /// Produit 1
          const CheckoutItem(
            title: "Soin anti-casse",
            subtitle: "300ml - 0.3 par ml",
            imageUrl: "https://i.postimg.cc/bdckSPpL/2.png",
          ),

          /// Produit 2
          const CheckoutItem(
            title: "Baume pour les mains",
            subtitle: "300ml - 0.3 par ml",
            imageUrl: "https://i.postimg.cc/6TJn4Ktj/Frame_1000005975.png",
          ),

          const SizedBox(height: 20),

          /// Livraison
          const Text(
            "Options de livraison",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          _deliveryOption(
            checked: true,
            title: "Standard",
            delay: "5 à 7 jours",
            price: "GRATUIT",
          ),

          _deliveryOption(
            checked: false,
            title: "Express",
            delay: "1-2 jours",
            price: "2000 fcfa",
          ),

          const SizedBox(height: 20),

          /// Paiement
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Option de paiement",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Modifier →",
                style: TextStyle(color: Color(0xFFD18B3E)),
              )
            ],
          ),

          const SizedBox(height: 12),

          /// Logos paiement
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _PayIcon(text: "GPay"),
              _PayIcon(text: "VISA"),
              _PayIcon(text: "MC"),
              _PayIcon(text: "Pay"),
              _PayIcon(text: "PayPal"),
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),

      /// Bottom bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Total général",
                    style: TextStyle(color: Colors.grey)),
                Text("15000 F",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD18B3E),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ConfirmationPage()),
                );
              },
              child: const Text("Procéder au paiement →"),
            ),
          ],
        ),
      ),
    );
  }

  /// Widgets helpers
  Widget _infoCard({required String title, required String content}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Color(0xFFD18B3E),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(content),
            ],
          ),
          const CircleAvatar(
            backgroundColor: Color(0xFFD18B3E),
            child: Icon(Icons.edit, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _deliveryOption({
    required bool checked,
    required String title,
    required String delay,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: checked ? const Color(0xFFEFF6F2) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Checkbox(value: checked, onChanged: (_) {}),
          Text(title),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD18B3E)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(delay),
          ),
          const Spacer(),
          Text(price,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class CheckoutItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const CheckoutItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                const Text(
                  "Il ne reste que 12 articles",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
                const SizedBox(height: 4),
                const Text(
                  "🚚 Livraison d'ici le jeu. 12 sept.",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.delete_outline),
        ],
      ),
    );
  }
}

class _PayIcon extends StatelessWidget {
  final String text;

  const _PayIcon({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text),
    );
  }
}