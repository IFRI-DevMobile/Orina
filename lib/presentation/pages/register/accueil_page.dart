import 'package:flutter/material.dart';
import 'vente_flash_page.dart';
import 'package:code_initial/presentation/pages/profile/profile_page.dart';
import 'package:code_initial/wishlist_page.dart';
import 'package:code_initial/cart_page.dart';
import 'package:code_initial/search_page.dart';
import 'package:code_initial/notifications_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color chocolate = Color(0xFFC98434);
  static const Color notifGreen = Color(0xFF4CD964);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Titre
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Bonjour!',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2E3338),
                      ),
                    ),
                  ),

                  // Page  recherche
                  IconButton(
                    onPressed: () {
                      // Navigation vers la page recherche
                       Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage()));
                    },
                    icon: const Icon(Icons.search),
                  ),

                  //  Page notifications
                  IconButton(
                    onPressed: () {
                      // Navigation vers la page notifications
                       Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationsPage()));
                    },
                    icon: const Icon(Icons.notifications_none),
                  ),

                  // Page paramètres
                  
                ],
              ),

              const SizedBox(height: 15),

              // ANNONCE
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Annonce',
                            style: TextStyle(
                              color: Color(0xFFBF6E2E),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Profitez dès maintenant de votre offre limitée. 50 % de réduction sur tous les produits !",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // flèche suivant
                    InkWell(
                      onTap: () {
                        // Navigation vers la page vente_flah_page.dart
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => VenteFlashPage()),
                        );
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: chocolate,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // VU RECEMMENT
              const Text(
                'Vu récemment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 64,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _circleVideo("assets/images/avatar1.png"),
                    const SizedBox(width: 12),
                    _circleVideo("assets/images/avatar2.png"),
                    const SizedBox(width: 12),
                    _circleVideo("assets/images/avatar3.png"),
                    const SizedBox(width: 12),
                    _circleVideo("assets/images/avatar1.png"),
                    const SizedBox(width: 12),
                    _circleVideo("assets/images/avatar2.png"),
                    const SizedBox(width: 12),
                    _circleVideo("assets/images/avatar3.png"),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Mes commandes
              const Text(
                'Mes commandes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 10),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    //  BUTTONS "Payer", "Recevoir", "A recevoir"
                    _OrderPill(label: 'Payer'),
                    SizedBox(width: 10),
                    _OrderPill(label: 'Recevoir', active: true, showDot: true),
                    SizedBox(width: 10),
                    _OrderPill(label: 'À recevoir'),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Histoires
              const Text(
                'Histoires',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _storyVideo("assets/images/avatar1.png", isLive: true),
                    const SizedBox(width: 12),
                    _storyVideo("assets/images/avatar2.png"),
                    const SizedBox(width: 12),
                    _storyVideo("assets/images/avatar3.png"),
                    const SizedBox(width: 12),
                    _storyVideo("assets/images/avatar1.png"),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      //Bar de navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: chocolate,
        unselectedItemColor: Colors.grey[600],
        onTap: (index) {
          //Navigation selon l'index de la barre
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          } else if (index == 1) {
               Navigator.push(context, MaterialPageRoute(builder: (_) => WishlistPage()));
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => VenteFlashPage()),
            );
          } else if (index == 3) {
               Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: ' Liste de souhaits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Offres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Compte',
          ),
        ],
      ),
    );
  }

  // Section "VU RECEMMENT"

  Widget _circleVideo(String path) {
    return ClipOval(
      child: Image.asset(path, width: 55, height: 55, fit: BoxFit.cover),
    );
  }

  //  Section "STORY"

  Widget _storyVideo(String path, {bool isLive = false}) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(path, fit: BoxFit.cover),
            if (isLive)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: notifGreen,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "LIVE",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.55),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.play_arrow, size: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Notif verte

class _OrderPill extends StatelessWidget {
  final String label;
  final bool active;
  final bool showDot;

  const _OrderPill({
    required this.label,
    this.active = false,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            // Navigation selon le label du bouton
            // if(label == 'Payer') {
            //   Navigator.push(context, MaterialPageRoute(builder: (_) => PayPage()));
            // } else if(label == 'Recevoir') {
            //   Navigator.push(context, MaterialPageRoute(builder: (_) => ReceivePage()));
            // } else if(label == 'À recevoir') {
            //   Navigator.push(context, MaterialPageRoute(builder: (_) => ToReceivePage()));
            // }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: active ? const Color(0xFFEFF7FB) : Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color.fromRGBO(158, 158, 158, 0.25),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        if (showDot)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFF4CD964),
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
