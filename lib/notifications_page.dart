import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
          "Notifications",
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
                "4 nouveaux",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: isSmallScreen ? 12 : 14,
                ),
              ),
            ),
          ),
        ],
      ),

      /// LISTE DES NOTIFICATIONS
      body: ListView(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        children: const [
          NotificationItem(
            title: "Alertes Nouveaux Produits",
            description:
                "Découvrez les dernières nouveautés en matière de beauté. "
                "Ne manquez pas les dernières tendances et les produits incontournables.",
            isNew: true,
          ),
          NotificationItem(
            title: "Offres Exclusives",
            description:
                "Vous avez débloqué une offre spéciale ! "
                "Appuyez pour révéler votre réduction.",
            isNew: true,
          ),
          NotificationItem(
            title: "Mises à jour de commande",
            description:
                "Votre commande a été expédiée ! "
                "Suivez votre livraison et restez informé de son évolution.",
            isNew: true,
          ),
          NotificationItem(
            title: "Notifications de réapprovisionnement",
            description:
                "Bonne nouvelle ! Le produit que vous aimiez est de nouveau en stock. "
                "Profitez-en avant qu'il ne soit à nouveau épuisé.",
            isNew: true,
          ),
          NotificationItem(
            title: "Rappels de panier",
            description:
                "Vous avez laissé quelque chose derrière vous ! "
                "Finalisez votre achat maintenant et profitez d'une expérience de paiement fluide.",
          ),
          NotificationItem(
            title: "Recommandations personnalisées",
            description:
                "D'après vos recherches récentes, nous avons trouvé des produits "
                "que vous allez adorer. Découvrez-les !",
          ),
          NotificationItem(
            title: "Alertes de baisse de prix",
            description:
                "Les prix ont baissé sur vos produits préférés ! "
                "Achetez maintenant et économisez beaucoup.",
          ),
          NotificationItem(
            title: "Récompenses de fidélité",
            description:
                "Vous avez gagné des récompenses ! "
                "Échangez vos points contre des réductions exclusives.",
          ),
        ],
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isNew;

  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      margin: EdgeInsets.only(bottom: isSmallScreen ? 10 : 12),
      padding: EdgeInsets.all(isSmallScreen ? 10 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ICONE
          Container(
            height: isSmallScreen ? 35 : 40,
            width: isSmallScreen ? 35 : 40,
            decoration: const BoxDecoration(
              color: Color(0xFFD18B3E),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: isSmallScreen ? 18 : 20,
            ),
          ),

          SizedBox(width: isSmallScreen ? 10 : 12),

          /// TEXTE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallScreen ? 14 : 16,
                        ),
                      ),
                    ),
                    if (isNew)
                      Container(
                        height: isSmallScreen ? 6 : 8,
                        width: isSmallScreen ? 6 : 8,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? 4 : 6),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: isSmallScreen ? 6 : 8),

          /// FLECHE
          Icon(Icons.arrow_forward_ios,
              size: isSmallScreen ? 14 : 16, color: Colors.grey),
        ],
      ),
    );
  }
}