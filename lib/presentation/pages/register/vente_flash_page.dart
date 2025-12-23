import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/navigation.dart';
import 'package:code_initial/presentation/pages/profile/profile_page.dart';
import 'package:code_initial/wishlist_page.dart';
import 'package:code_initial/cart_page.dart';
import 'package:code_initial/presentation/pages/register/accueil_page.dart';

const Color chocolate = Color(0xFFC98434);
const Color background = Color(0xFFF6F6F6);
const Color discountGreen = Color(0xFF4CD964);

class VenteFlashPage extends StatefulWidget {
  const VenteFlashPage({super.key});

  @override
  State<VenteFlashPage> createState() => _VenteFlashPageState();
}

class _VenteFlashPageState extends State<VenteFlashPage> {
  int selectedDiscount = 0;

  final List<String> discounts = ["All", "10%", "20%", "30%", "40%"];

  // Exemple de produits — chaque produit a un nom, un prix et une liste d'images (URLs ou assets)
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Soin anti-casse',
      'price': '6 000 FCFA',
      'discount': 40,
      'images': [
        'https://i.postimg.cc/N0kqYkGj/Frame_1000005976_(3).png',
        'https://i.postimg.cc/q7shTSCX/Frame_1000006004.png',
        'https://i.postimg.cc/fbctNp07/Frame_1000006000.png',
      ],
    },
    {
      'name': 'Produit cosmétique',
      'price': '5 500 FCFA',
      'discount': 20,
      'images': [
        'https://i.postimg.cc/q7shTSCX/Frame_1000006004.png',
        'https://i.postimg.cc/GpF8CVsx/Frame_1000006002.png',
      ],
    },
    {
      'name': 'Beurre naturel',
      'price': '8 000 FCFA',
      'discount': 10,
      'images': ['assets/images/glow.png', 'assets/images/glow1.png'],
    },
    {
      'name': 'Crème hydratante',
      'price': '7 200 FCFA',
      'discount': 30,
      'images': ['assets/images/glow2.png', 'assets/images/glow4.png'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      // ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: chocolate,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
               Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
              break;
            case 1:
               Navigator.push(context, MaterialPageRoute(builder: (_) => WishlistPage()));
              break;
            case 2:
              break;
            case 3:
               Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Souhaits",
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Panier",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Compte",
          ),
        ],
      ),

      // BODY 
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // HEADER (FOND BLANC) 
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Vente Flash",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Choose your discount",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    // ===== MINUTEUR =====
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            color: Colors.blue,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          _timeBox("1"),
                          _separator(),
                          _timeBox("36"),
                          _separator(),
                          _timeBox("58"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //  FILTERS 
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(discounts.length, (index) {
                        final selected = selectedDiscount == index;
                        return GestureDetector(
                          onTap: () => setState(() => selectedDiscount = index),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: selected ? chocolate : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: chocolate),
                            ),
                            child: Text(
                              discounts[index],
                              style: TextStyle(
                                color: selected ? Colors.white : chocolate,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),

            //RADIANT GLOW 
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "RADIANT GLOW",
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _glow("assets/images/glow.png", 80),
                            _glow("assets/images/glow1.png", 65),
                            _glow("assets/images/glow2.png", 50),
                            _glow("assets/images/glow4.png", 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // TITLE 
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Réduction de 20%",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => ReductionPage()));
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            //  GRID PRODUITS 
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // Apply filter based on selectedDiscount
                    final filtered = selectedDiscount == 0
                        ? products
                        : products
                              .where(
                                (p) =>
                                    (p['discount'] ?? 0) ==
                                    int.parse(
                                      discounts[selectedDiscount].replaceAll(
                                        '%',
                                        '',
                                      ),
                                    ),
                              )
                              .toList();

                    if (filtered.isEmpty) {
                      return Container(
                        alignment: Alignment.center,
                        child: const Text('Aucun produit'),
                      );
                    }

                    final product = filtered[index % filtered.length];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.PRODUCT,
                          arguments: {
                            'productName': product['name'],
                            'productPrice': product['price'],
                            'productImage':
                                (product['images'] as List).isNotEmpty
                                ? (product['images'] as List).first
                                : null,
                            'productImages': product['images'],
                          },
                        );
                      },
                      child: _productCard(product),
                    );
                  },
                  childCount: selectedDiscount == 0
                      ? products.length
                      : products
                            .where(
                              (p) =>
                                  (p['discount'] ?? 0) ==
                                  int.parse(
                                    discounts[selectedDiscount].replaceAll(
                                      '%',
                                      '',
                                    ),
                                  ),
                            )
                            .length,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }

  // WIDGETS
  Widget _glow(String path, double width) {
    return SizedBox(
      width: width,
      height: 90,
      child: Image.asset(path, fit: BoxFit.contain),
    );
  }

  Widget _timeBox(String v) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(v, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _separator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text("|", style: TextStyle(color: Colors.grey)),
    );
  }

  Widget _productCard(Map<String, dynamic> product) {
    final images = (product['images'] as List).cast<String>();
    final img = images.isNotEmpty ? images.first : null;

    Widget imgWidget;
    if (img == null) {
      imgWidget = Container(color: Colors.grey.shade200);
    } else if (img.startsWith('http')) {
      imgWidget = Image.network(img, fit: BoxFit.contain);
    } else {
      imgWidget = Image.asset(img, fit: BoxFit.contain);
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.grey.shade200,
                    child: imgWidget,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: discountGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      product.containsKey('discount')
                          ? '-${product['discount']}%'
                          : '',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product['name'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            product['price'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
