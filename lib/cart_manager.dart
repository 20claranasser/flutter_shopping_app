class CartManager {
  static List<Map<String, String>> cartItems = [];

  static double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      String priceStr = item['price']!.replaceAll(' EGP', '').replaceAll(',', '').trim();
      total += double.tryParse(priceStr) ?? 0;
    }
    return total;
  }

  // NEW: Function to empty the cart
  static void clearCart() {
    cartItems.clear();
  }
}