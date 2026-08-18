import 'package:flutter/material.dart';
import '../cart_manager.dart';
import '../product_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // 1. Change: Start with an empty list instead of all items
  List<Map<String, String>> results = [];

  void _filter(String q) {
    setState(() {
      // 2. Change: If the search query is empty, clear the results
      if (q.isEmpty) {
        results = [];
      } else {
        results = ProductData.getAllItems()
            .where((i) => i['name']!.toLowerCase().contains(q.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true, 
          onChanged: _filter, 
          decoration: const InputDecoration(
            hintText: "Search women fashion...", 
            border: InputBorder.none
          )
        )
      ),
      // Optional: Show a message when the list is empty
      body: results.isEmpty 
        ? const Center(child: Text("Type something to search...")) 
        : ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, i) => ListTile(
              leading: Image.network(results[i]['image']!, width: 40),
              title: Text(results[i]['name']!),
              subtitle: Text(results[i]['price']!, style: const TextStyle(color: Colors.red)),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart, color: Colors.red), 
                onPressed: () { 
                  CartManager.cartItems.add(results[i]); 
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added"))); 
                }
              ),
            ),
          ),
    );
  }
}