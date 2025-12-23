import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/navigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      bottomNavigationBar: _buildBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // Avatar / Nom / Email
              CircleAvatar(
                radius: 44,
                backgroundColor: Colors.orange.shade100,
                child: Text(
                  "VI",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.orange.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "VIDEDANNON Iffa Symelle",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                "zapabdieu@amen.com",
                style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 28),

              // Sections as a responsive grid
              _buildSectionTitle("Actions"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int cross = 1;
                    if (constraints.maxWidth >= 900) {
                      cross = 3;
                    } else if (constraints.maxWidth >= 520) {
                      cross = 2;
                    }
                    final items = [
                      {
                        'icon': Icons.person_outline,
                        'title': 'Compte',
                        'subtitle': 'Modifier les détails du compte',
                        'onTap': () {},
                      },
                      {
                        'icon': Icons.notifications_none,
                        'title': 'Notifications',
                        'subtitle': 'Voir toutes les notifications',
                        'onTap': () {},
                      },
                      {
                        'icon': Icons.settings_outlined,
                        'title': 'Paramètres',
                        'subtitle': 'Définir mes préférences',
                        'onTap': () {},
                      },
                      {
                        'icon': Icons.help_outline,
                        'title': 'Aides',
                        'subtitle': 'Se faire aider',
                        'onTap': () {},
                      },
                    ];

                    return GridView.count(
                      crossAxisCount: cross,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 2.6,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: items.map((it) {
                        return _buildCardItem(
                          icon: it['icon'] as IconData,
                          title: it['title'] as String,
                          subtitle: it['subtitle'] as String,
                          onTap: it['onTap'] as VoidCallback,
                        );
                      }).toList(),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Déconnexion
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.orange.shade700,
                      elevation: 0,
                      side: BorderSide(color: Colors.orange.shade100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Get.offAllNamed(Routes.ONBOARDING);
                    },
                    child: Text(
                      'Déconnexion',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange.shade700,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Widgets réutilisables ----------

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.orange.shade700,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildCardItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 0,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.orange.shade700),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(subtitle, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 4,
      selectedItemColor: Colors.orange.shade700,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Accueil",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Liste de souhaits",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer_outlined),
          label: "Offres",
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
    );
  }
}
