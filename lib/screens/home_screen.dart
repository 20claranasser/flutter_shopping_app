import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Products"), // ■ Requirement: Title
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ■ PageView (Featured images)
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  Image.network('https://images.unsplash.com/photo-1445205170230-053b83e2b6ad?w=600', fit: BoxFit.cover),
                  Image.network('https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=600', fit: BoxFit.cover),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("New Arrivals", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            // ■ GridView (2 items per row)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Expanded(child: Image.network('https://images.unsplash.com/photo-1539109136881-3be0616acf4b?w=200', fit: BoxFit.cover)),
                      const Text("Fashion Item", style: TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart, color: Colors.pinkAccent),
                        onPressed: () {
                          // ■ SnackBar Requirement
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item added to the cart")));
                        },
                      )
                    ],
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Hot Offers", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            // ■ Hot Offers (ListView.builder with Expanded)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network('https://images.unsplash.com/photo-1472806426350-60358bb456cf?w=100'),
                  title: const Text("Special Discount Offer"),
                  subtitle: const Text("Get 50% OFF on Summer Dresses"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}