import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> _products = [
    {'image': 'assets/product1.png', 'name': 'Product 1'},
    {'image': 'assets/product2.jpg', 'name': 'Product 2'},
    {'image': 'assets/product3.png', 'name': 'Product 3'},
    {'image': 'assets/product4.png', 'name': 'Product 4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commerception'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: _products[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(_products[index]['image']!, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_products[index]['name']!),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
