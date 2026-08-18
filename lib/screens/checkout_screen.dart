import 'package:flutter/material.dart';
import '../cart_manager.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout"), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0.5),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Shipping Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: "Full Name", border: OutlineInputBorder())),
            const SizedBox(height: 10),
            const TextField(decoration: InputDecoration(labelText: "Address", border: OutlineInputBorder())),
            const SizedBox(height: 10),
            const TextField(decoration: InputDecoration(labelText: "Phone Number", border: OutlineInputBorder())),
            const Spacer(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Amount:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${CartManager.getTotalPrice()} EGP", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                // 1. Clear the cart
                CartManager.clearCart();
                
                // 2. Show Success Message
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Success!"),
                    content: const Text("Your order has been placed successfully."),
                    actions: [
                      TextButton(onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
                      }, child: const Text("Back to Home"))
                    ],
                  ),
                );
              },
              child: const Text("CONFIRM ORDER", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}