import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0),
      appBar: AppBar(
        title: Text(
          product['name']!,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF769FCD),  // Strong Blue for AppBar
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hero Animation for Product Image
              Hero(
                tag: product['name']!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    product['image']!,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Product Name and Favorite Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product['name']!,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Light Blue for Product Name
                          ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {
                      // Placeholder for favorite action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product['name']} added to favorites!')),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Divider
              Divider(thickness: 1, color: Colors.grey.shade300),
              SizedBox(height: 10),

              // Product Description Header
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Strong Blue for Section Headers
                    ),
              ),
              SizedBox(height: 5),

              // Product Description Text
              Text(
                'Description of ${product['name']}.',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: Colors.black, // Light Blue for Text
                    ),
              ),
              SizedBox(height: 20),

              // Tags or Chips
              Wrap(
                spacing: 8,
                children: [
                  Chip(
                    label: Text('Best Seller'),
                    backgroundColor: Color(0xFFB9D7EA), // Light Blue Background for Chips
                    labelStyle: TextStyle(color: Colors.black), // White Text for Chips
                  ),
                  Chip(
                    label: Text('New Arrival'),
                    backgroundColor: Color(0xFFB9D7EA), // Light Blue Background for Chips
                    labelStyle: TextStyle(color: Colors.black), // White Text for Chips
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Buy Now Button with Rounded Style
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Buy Now clicked for ${product['name']}!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB9D7EA),  // Light Blue Background for the Button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 5,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Strong Blue Text for the Button
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
