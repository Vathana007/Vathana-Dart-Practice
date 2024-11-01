import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: 48, height: 48), 
            const SizedBox(height: 16), 
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

enum Product {
  dart("Dart", "The best object language", "assets/W4-S1-Practice/dart.png"),
  flutter("Flutter", "The best mobile UI library", "assets/W4-S1-Practice/flutter.png"),
  firebase("Firebase", "The best cloud database", "assets/W4-S1-Practice/firebase.png");

  final String title;
  final String description;
  final String imagePath;

  const Product(this.title, this.description, this.imagePath);
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Container(
        color: Colors.blue,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: Product.values.map((product) {
            return ProductCard(
              title: product.title,
              description: product.description,
              imagePath: product.imagePath,
            );
          }).toList(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProductList(),
  ));
}
