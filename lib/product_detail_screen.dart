import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Column(
        children: [
          Image.asset(product['image']!, height: 300),
          SizedBox(height: 20),
          Text(
            product['name']!,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'This is a detailed description of ${product['name']}.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
