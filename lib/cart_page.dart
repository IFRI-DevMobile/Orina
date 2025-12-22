import 'package:flutter/material.dart';
import 'checkout_page.dart';
import 'wishlist_page.dart';
import 'notifications_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EE),

      /// APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          "Votre Panier",
          style: TextStyle(
            color: Colors.black,
            fontSize: isSmallScreen ? 18 : 20,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: isSmallScreen ? 12 : 16),
            child: Center(
              child: Text(
                "3 articles",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: isSmallScreen ? 12 : 14,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          /// ADRESSE
          Padding(
            padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
            child: Container(
              padding: EdgeInsets.all(isSmallScreen ? 10 : 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Adresse de livraison",
                        style: TextStyle(
                          color: Color(0xFFD18B3E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Agbou;2 porto-novo"),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Color(0xFFD18B3E),
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          /// ARTICLES
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16),
              children: const [
                CartItem(
                  title: "Crème anti-eczéma",
                  price: 5000,
                  oldPrice: 6000,
                  discount: "-55%",
                  rating: 3.5,
                  reviews: 23,
                  size: "100ml",
                  imageUrl: "https://i.postimg.cc/yW4c3Ksf/Frame_1000006013.png",
                ),
                CartItem(
                  title: "Huile de cuisson",
                  price: 3500,
                  oldPrice: 5000,
                  discount: "-60%",
                  rating: 4.8,
                  reviews: 512,
                  size: "250ml",
                  imageUrl: "https://i.postimg.cc/bdckSPpL/2.png",
                ),
              ],
            ),
          ),

          /// TOTAL + BOUTON
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 16 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "8500 FCFA",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 16 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? 12 : 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD18B3E),
                      padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 12 : 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CheckoutPage()),
                      );
                    },
                    child: Text(
                      "Passer à la caisse →",
                      style: TextStyle(fontSize: isSmallScreen ? 14 : 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      /// BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: const Color(0xFFD18B3E),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            // Home - perhaps go back or something
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WishlistPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationsPage()),
            );
          } else if (index == 4) {
            // Account
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Liste de souhaits"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined), label: "Offres"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Panier"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Compte"),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String title;
  final int price;
  final int oldPrice;
  final String discount;
  final double rating;
  final int reviews;
  final String size;
  final String imageUrl;

  const CartItem({
    super.key,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.size,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      margin: EdgeInsets.only(bottom: isSmallScreen ? 12 : 16),
      padding: EdgeInsets.all(isSmallScreen ? 10 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          /// IMAGE
          Container(
            height: isSmallScreen ? 70 : 80,
            width: isSmallScreen ? 70 : 80,
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

          SizedBox(width: isSmallScreen ? 10 : 12),

          /// INFOS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
                SizedBox(height: isSmallScreen ? 4 : 6),

                /// PRIX
                Row(
                  children: [
                    Text(
                      "$price fcfa",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: isSmallScreen ? 4 : 6),
                    Text(
                      "$oldPrice F",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: isSmallScreen ? 12 : 14,
                      ),
                    ),
                    SizedBox(width: isSmallScreen ? 4 : 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        discount,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isSmallScreen ? 4 : 6),

                /// NOTE
                Row(
                  children: [
                    const Icon(Icons.star,
                        size: 16, color: Colors.orange),
                    SizedBox(width: isSmallScreen ? 2 : 4),
                    Text(
                      "$rating/5",
                      style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                    ),
                    SizedBox(width: isSmallScreen ? 2 : 4),
                    Text(
                      "($reviews)",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: isSmallScreen ? 12 : 14,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isSmallScreen ? 4 : 6),
                Text(
                  "Quantité : 1  |  Size: $size",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
              ],
            ),
          ),

          /// SUPPRIMER
          const Icon(Icons.delete_outline),
        ],
      ),
    );
  }
}