import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String? productName;
  final String? productPrice;
  final String? productImage;
  final List<String>? productImages;

  const ProductPage({
    super.key,
    this.productName,
    this.productPrice,
    this.productImage,
    this.productImages,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late PageController _pageController;
  int _currentImageIndex = 0;
  late List<String> _images;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Build images list: prefer provided productImages, otherwise defaults.
    if (widget.productImages != null && widget.productImages!.isNotEmpty) {
      _images = List.from(widget.productImages!);
      // if single productImage provided, ensure it's first
      if (widget.productImage != null && widget.productImage!.isNotEmpty) {
        if (!_images.contains(widget.productImage)) {
          _images.insert(0, widget.productImage!);
        }
      }
    } else {
      _images = [
        if (widget.productImage != null && widget.productImage!.isNotEmpty)
          widget.productImage!,
        'assets/images/intro3.png',
        'assets/images/intro4.png',
        'assets/images/intro5.png',
        'assets/images/gemini1.png',
      ];
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFD08C3A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Galerie d'images avec PageView
          Container(
            height: 280,
            width: double.infinity,
            color: const Color(0xFFD08C3A),
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentImageIndex = index);
                  },
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    final src = _images[index];
                    return Center(child: _buildImage(src, height: 200));
                  },
                ),
                // Indicateurs de pagination
                Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _images.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentImageIndex == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentImageIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Contenu
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.productName ?? 'Soin anti-casse',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Voir des similaires'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Prix
                    Row(
                      children: [
                        Text(
                          widget.productPrice ?? '8000 fcfa',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '10000F',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '-40%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Note
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        Icon(Icons.star_half, color: Colors.orange, size: 18),
                        SizedBox(width: 8),
                        Text('4.5/5 (2,346)'),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Description
                    const Text(
                      '300ml - 0.3F par ml\n\n'
                      'Riche en nutriments essentiels et reconnu pour ses vertus exceptionnelles, '
                      'ce beurre de karité pur et naturel offre une hydratation profonde dès la '
                      'première application. Sa texture onctueuse fond délicatement au contact '
                      'de la peau, libérant un voile nourrissant qui répare, adoucit et protège durablement.',
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),

                    const SizedBox(height: 12),

                    TextButton(
                      onPressed: () {},
                      child: const Text('Voir tous les détails →'),
                    ),

                    const SizedBox(height: 16),

                    // Galerie des images
                    const Text(
                      'Galerie des images',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: _currentImageIndex == index
                                      ? const Color(0xFFD08C3A)
                                      : Colors.grey.shade300,
                                  width: _currentImageIndex == index ? 3 : 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: _buildImage(
                                  _images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Barre du bas
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
              ],
            ),
            child: Row(
              children: [
                Text(
                  widget.productPrice ?? '8000 fcfa',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD08C3A),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'PAYER →',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Add as a method inside file but outside class for reuse
Widget _buildImage(String src, {double? height, BoxFit? fit}) {
  if (src.startsWith('http')) {
    return Image.network(
      src,
      height: height,
      fit: fit ?? BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.image_not_supported, size: 80);
      },
    );
  }
  return Image.asset(
    src,
    height: height,
    fit: fit ?? BoxFit.contain,
    errorBuilder: (context, error, stackTrace) {
      return const Icon(Icons.image_not_supported, size: 80);
    },
  );
}
