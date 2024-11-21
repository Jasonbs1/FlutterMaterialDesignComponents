import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> _products = [
    {'image': 'assets/chains1.png', 'name': 'Chains 1'},
    {'image': 'assets/chains2.png', 'name': 'Chains 2'},
    {'image': 'assets/chains3.png', 'name': 'Chains 3'},
    {'image': 'assets/chains4.png', 'name': 'Chains 4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0),
      appBar: AppBar(
        backgroundColor: Color(0xFF769FCD),
        title: Row(
          children: [
            // Menambahkan Logo di sebelah kiri
            Image.asset(
              'assets/logo1.png', // Ganti dengan path logo Anda
              height: 30,
            ),
            SizedBox(width: 10),
            // Teks judul aplikasi di sebelah logo
            Text(
              'Chains',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            tooltip: 'Cart',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(  
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF769FCD),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF769FCD),
                      size: 30,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color(0xFF769FCD)),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Color(0xFF769FCD)),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info, color: Color(0xFF769FCD)),
              title: Text('About'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Color(0xFF769FCD)),
              title: Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.6),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailScreen(product: _products[index]),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Responsive Product Image
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              _products[index]['image']!,
                              fit: BoxFit.cover,
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                            ),
                          );
                        },
                      ),
                    ),

                    // Product Name
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _products[index]['name']!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
