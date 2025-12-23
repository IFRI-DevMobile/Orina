import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> allProducts = [
    {
      "title": "Huile de cuisson",
      "price": "2000 fcfa",
      "oldPrice": "5000F",
      "discount": "-40%",
      "imageUrl": "https://i.postimg.cc/bdckSPpL/2.png",
    },
    {
      "title": "Pâte tartinable au karité",
      "price": "3200 fcfa",
      "oldPrice": "5000F",
      "discount": "-50%",
      "imageUrl": "https://i.postimg.cc/ThMg5xft/bb.png",
    },
    {
      "title": "Masque capillaire",
      "price": "1500 fcfa",
      "oldPrice": "3000F",
      "discount": "-20%",
      "imageUrl": "https://i.postimg.cc/6TJn4Ktj/Frame_1000005975.png",
    },
    {
      "title": "Huile capillaire",
      "price": "1500 fcfa",
      "oldPrice": "3000F",
      "discount": "-50%",
      "imageUrl": "https://i.postimg.cc/0rRDKvPX/Frame_1000005976.png",
    },
    {
      "title": "Chantilly de karité",
      "price": "1200 fcfa",
      "oldPrice": "3000F",
      "discount": "-20%",
      "imageUrl": "https://i.postimg.cc/yW4c3Ksf/Frame_1000006013.png",
    },
    {
      "title": "Beurre pour locks",
      "price": "2500 fcfa",
      "oldPrice": "5000F",
      "discount": "-40%",
      "imageUrl": "https://i.postimg.cc/6TJn4Ktj/Frame_1000005975.png",
    },
  ];

  late List<Map<String, String>> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts;
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final crossAxisCount = isSmallScreen ? 2 : 3;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EE),

      /// APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: "Search...",
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.grey),
              suffixIcon:
                  Icon(Icons.qr_code_scanner, color: Colors.grey),
            ),
            onChanged: (value) {
              setState(() {
                filteredProducts = allProducts
                    .where((p) => p["title"]!
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              });
            },
          ),
        ),
      ),

      /// BODY
      body: GridView.count(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
        children: filteredProducts.map((product) {
          return GestureDetector(
            onTap: () {
              debugPrint("Produit cliqué : ${product["title"]}");
            },
            child: ProductCard(
              title: product["title"]!,
              price: product["price"]!,
              oldPrice: product["oldPrice"]!,
              discount: product["discount"]!,
              imageUrl: product["imageUrl"]!,
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// PRODUCT CARD (INCHANGÉ)
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
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

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
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  height: isSmallScreen ? 100 : 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
                Text(
                  oldPrice,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: 12,
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
