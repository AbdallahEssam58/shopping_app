import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  final List<Map<String, String>> _products = const [
    {
      'image': 'assets/images/MacBook Pro 16.png',
      'name': 'MacBook Pro 16"',
      'price': '\$2,399',
    },
    {
      'image': 'assets/images/Wireless Headphones.png',
      'name': 'Wireless Headphones',
      'price': '\$299',
    },
    {
      'image': 'assets/images/Smart Watch.png',
      'name': 'Smart Watch',
      'price': '\$399',
    },
    {
      'image': 'assets/images/Designer Backpack.png',
      'name': 'Designer Backpack',
      'price': '\$129',
    },
    {
      'image': 'assets/images/Premium Keyboard.png',
      'name': 'Premium Keyboard',
      'price': '\$129',
    },
    {
      'image': 'assets/images/Wireless Mouse.png',
      'name': 'Wireless Mouse',
      'price': '\$129',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6A82FB), Color(0xFF9D50BB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              width: double.infinity,
              child: const Center(
                child: Text(
                  "Our Products",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Featured Products",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    CarouselSlider(
                      items: [
                        _buildFeatureCard(
                          assetPath:
                              'assets/images/Screenshot 2025-09-30 175727.png',
                          title: 'Premium Laptop Collection',
                        ),
                        _buildFeatureCard(
                          assetPath:
                              'assets/images/Screenshot 2025-09-30 175446.png',
                          title: 'Professional Workspace',
                        ),
                        _buildFeatureCard(
                          assetPath:
                              'assets/images/Screenshot 2025-09-30 175935.png',
                          title: 'Ambient Lighting',
                        ),
                      ],
                      options: CarouselOptions(
                        height: 180,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        viewportFraction: 0.85,
                      ),
                    ),

                    const SizedBox(height: 24),
                    Center(
                      child: const Text(
                        "Shop Our Collection",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.75,
                          ),
                      itemBuilder: (context, index) {
                        final product = _products[index];
                        return _buildProductCard(
                          context,
                          imagePath: product['image']!,
                          name: product['name']!,
                          price: product['price']!,
                        );
                      },
                    ),

                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        "Hot Offers 🔥",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    _buildOfferCard(
                      "50% Off Electronics",
                      "Limited time offer on all tech gadgets",
                      "50% OFF",
                    ),
                    _buildOfferCard(
                      "Free Shipping Weekend",
                      "No delivery charges on orders above \$50",
                      "FREE SHIP",
                    ),
                    _buildOfferCard(
                      "Buy 2 Get 1 Free",
                      "On selected accessories and peripherals",
                      "B2G1",
                    ),
                    _buildOfferCard(
                      "Student Discount",
                      "Extra 20% off with valid student ID",
                      "20% OFF",
                    ),
                    _buildOfferCard(
                      "Bundle Deals",
                      "Save more when you buy complete setups",
                      "BUNDLE",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({required String assetPath, required String title}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(assetPath, fit: BoxFit.cover),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context, {
    required String imagePath,
    required String name,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Product "$name" added to cart.'),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 18,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferCard(String title, String desc, String tag) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(desc),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6A82FB), Color(0xFF9D50BB)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tag,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
