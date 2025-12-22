import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Confirmation",
          style: TextStyle(color: Colors.black, fontSize: isSmallScreen ? 18 : 20),
        ),
        centerTitle: true,
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          children: [
            /// Carte principale
            Container(
              width: double.infinity,
              constraints: BoxConstraints(maxWidth: isSmallScreen ? double.infinity : 400),
              padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF7FB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  /// Check icon
                  Container(
                    height: isSmallScreen ? 60 : 70,
                    width: isSmallScreen ? 60 : 70,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD18B3E),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.network(
                        "https://i.postimg.cc/kG6X3trs/Frame_1000006042.png",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.check, color: Colors.black, size: 40),
                      ),
                    ),
                  ),

                  SizedBox(height: isSmallScreen ? 16 : 20),

                  Text(
                    "Thank you!",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 18 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: isSmallScreen ? 4 : 6),

                  Text(
                    "Votre transaction a été réussie\n#ID-22465476578390-3789",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: isSmallScreen ? 14 : 16),
                  ),

                  SizedBox(height: isSmallScreen ? 16 : 20),

                  /// Infos transaction
                  _infoRow("Date", "01/24/2023", isSmallScreen),
                  _infoRow("Temps", "10h15", isSmallScreen),
                  _infoRow("À", "PORTO", isSmallScreen),

                  const Divider(height: 30),

                  /// Total
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
                        "15000 FCFA",
                        style: TextStyle(
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: isSmallScreen ? 12 : 16),

                  /// Moyen de paiement
                  Container(
                    padding: EdgeInsets.all(isSmallScreen ? 10 : 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFD18B3E)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: isSmallScreen ? 20 : 24,
                          width: isSmallScreen ? 20 : 24,
                          child: Image.network(
                            "https://i.postimg.cc/NF9fqrhk/SVGRepo_icon_Carrier.png",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.account_balance_wallet, color: Colors.blue),
                          ),
                        ),
                        SizedBox(width: isSmallScreen ? 6 : 8),
                        Text(
                          "Google Pay\namanda@okaxis",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: isSmallScreen ? 14 : 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: isSmallScreen ? 16 : 20),

                  /// Barcode placeholder
                  Container(
                    height: isSmallScreen ? 60 : 70,
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      "||||||||||||||||||||||||||||||||||||",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 16 : 20,
                        letterSpacing: 2,
                      ),
                    ),
                  ),

                  SizedBox(height: isSmallScreen ? 8 : 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 10 : 12,
                        vertical: isSmallScreen ? 4 : 6,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFD18B3E)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "payée",
                        style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: isSmallScreen ? 20 : 30),

            /// Retour accueil
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFD18B3E)),
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 20 : 24,
                  vertical: isSmallScreen ? 12 : 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.arrow_back, color: Color(0xFFD18B3E)),
              label: Text(
                "Retour à l'accueil",
                style: TextStyle(
                  color: Color(0xFFD18B3E),
                  fontSize: isSmallScreen ? 14 : 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value, bool isSmallScreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: isSmallScreen ? 14 : 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: isSmallScreen ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }
}