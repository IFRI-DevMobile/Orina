import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final crossAxisCount = isSmallScreen ? 2 : 3;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EE),

      /// APP BAR (search)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  "Search...",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Icon(Icons.qr_code_scanner, color: Colors.grey),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Historique
            _sectionHeader("Historique de recherche", icon: Icons.delete, isSmallScreen: isSmallScreen),
            SizedBox(height: isSmallScreen ? 8 : 10),
            _chipsWrap([
              "Crayon à sourcils",
              "Matte Lipstick",
              "Blush Stick",
              "Beurre pour locks",
              "Baume à lèvres",
              "Gel Eyeliner",
              "Setting Spray",
            ], isSmallScreen),

            SizedBox(height: isSmallScreen ? 16 : 20),

            /// Recommandations
            _sectionHeader("Recommendations", isSmallScreen: isSmallScreen),
            SizedBox(height: isSmallScreen ? 8 : 10),
            _chipsWrap([
              "Huile de cuisson",
              "Beurre pour locks",
              "Setting Spray",
              "Chantilly de karité",
              "Masque capillaire",
              "Glow Foundation",
              "Gel Eyeliner",
            ], isSmallScreen),

            SizedBox(height: isSmallScreen ? 20 : 25),

            /// Découvrir
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Découvrir",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Voir tout →",
                  style: TextStyle(
                    color: Color(0xFFD18B3E),
                    fontWeight: FontWeight.w500,
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                )
              ],
            ),

            SizedBox(height: isSmallScreen ? 12 : 15),

            /// Produits
            GridView.count(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.75,
              children: const [
                ProductCard(
                  title: "Huile de cuisson",
                  price: "2000 fcfa",
                  oldPrice: "5000F",
                  discount: "-40%",
                  imageUrl: "https://i.postimg.cc/bdckSPpL/2.png",
                ),
                ProductCard(
                  title: "Pâte tartinable au karité",
                  price: "3200 fcfa",
                  oldPrice: "5000F",
                  discount: "-50%",
                  imageUrl: "https://i.postimg.cc/ThMg5xft/bb.png",
                ),
                ProductCard(
                  title: "Masque capillaire",
                  price: "1500 fcfa",
                  oldPrice: "3000F",
                  discount: "-20%",
                  imageUrl: "https://i.postimg.cc/6TJn4Ktj/Frame_1000005975.png",
                ),
                ProductCard(
                  title: "Huile capillaire",
                  price: "1500 fcfa",
                  oldPrice: "3000F",
                  discount: "-50%",
                  imageUrl: "https://i.postimg.cc/0rRDKvPX/Frame_1000005976.png",
                ),
                ProductCard(
                  title: "Chantilly de karité",
                  price: "1200 fcfa",
                  oldPrice: "3000F",
                  discount: "-20%",
                  imageUrl: "https://i.postimg.cc/yW4c3Ksf/Frame_1000006013.png",
                ),
                ProductCard(
                  title: "Beurre pour locks",
                  price: "2500 fcfa",
                  oldPrice: "5000F",
                  discount: "-40%",
                  imageUrl: "https://i.postimg.cc/6TJn4Ktj/Frame_1000005975.png",
                ),
              ],
            ),
          ],
        ),
      ),

      /// BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFFD18B3E),
        unselectedItemColor: Colors.grey,
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

  /// Section title
  Widget _sectionHeader(String title, {IconData? icon, required bool isSmallScreen}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isSmallScreen ? 16 : 18,
          ),
        ),
        if (icon != null)
          Icon(icon, color: Colors.red),
      ],
    );
  }

  /// Chips
  Widget _chipsWrap(List<String> items, bool isSmallScreen) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items
          .map(
            (e) => Chip(
              backgroundColor: Colors.white,
              label: Text(
                e,
                style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
          .toList(),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String oldPrice;
  final String discount;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: isSmallScreen ? 100 : 120,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
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
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    discount,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(isSmallScreen ? 6 : 8),
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
                SizedBox(height: isSmallScreen ? 2 : 4),
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
                Text(
                  oldPrice,
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: isSmallScreen ? 10 : 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}