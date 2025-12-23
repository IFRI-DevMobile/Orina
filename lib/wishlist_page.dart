import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'notifications_page.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

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
          "Liste de souhaits",
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
                "12 articles",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: isSmallScreen ? 12 : 14,
                ),
              ),
            ),
          ),
        ],
      ),

      /// LISTE
      body: ListView(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        children: const [
          WishlistItem(
            title: "Baume à lèvres",
            price: 1400,
            oldPrice: 3000,
            discount: "-40%",
            rating: 4.7,
            reviews: 346,
            imageUrl: "https://i.postimg.cc/bdckSPpL/2.png",
          ),
          WishlistItem(
            title: "Beurre pour locks",
            price: 650,
            oldPrice: 2000,
            discount: "-20%",
            rating: 4.5,
            reviews: 2346,
            imageUrl: "https://i.postimg.cc/ThMg5xft/bb.png",
          ),
          WishlistItem(
            title: "Chantilly de karité",
            price: 1500,
            oldPrice: 3000,
            discount: "-60%",
            rating: 4.8,
            reviews: 512,
            imageUrl: "https://i.postimg.cc/6TJn4Ktj/Frame_1000005975.png",
          ),
          WishlistItem(
            title: "Huile de cuisson",
            price: 2000,
            oldPrice: 3000,
            discount: "-40%",
            rating: 4.0,
            reviews: 1782,
            imageUrl: "https://i.postimg.cc/0rRDKvPX/Frame_1000005976.png",
          ),
          WishlistItem(
            title: "Pâte tartinable au karité",
            price: 3200,
            oldPrice: 5000,
            discount: "-55%",
            rating: 3.5,
            reviews: 23,
            imageUrl: "https://i.postimg.cc/yW4c3Ksf/Frame_1000006013.png",
          ),
          WishlistItem(
            title: "Huile capillaire",
            price: 3200,
            oldPrice: 5200,
            discount: "-40%",
            rating: 4.5,
            reviews: 2346,
            imageUrl: "https://i.postimg.cc/6TJn4Ktj/Frame_1000005975.png",
          ),
        ],
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFFD18B3E),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            // Home
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationsPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            );
          } else if (index == 4) {
            // Account
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Liste de souhaits"),
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

class WishlistItem extends StatelessWidget {
  final String title;
  final int price;
  final int oldPrice;
  final String discount;
  final double rating;
  final int reviews;
  final String imageUrl;

  const WishlistItem({
    super.key,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
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
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: isSmallScreen ? 12 : 14,
                      ),
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

                SizedBox(height: isSmallScreen ? 6 : 8),

                /// BOUTON
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 12 : 16,
                      vertical: isSmallScreen ? 6 : 8,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined,
                      size: 18),
                  label: Text(
                    "Move to cart",
                    style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                  ),
                )
              ],
            ),
          ),

          /// FAVORI
          const Icon(Icons.favorite, color: Colors.red),
        ],
      ),
    );
  }
}