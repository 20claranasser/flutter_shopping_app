class ProductData {
  static final Map<String, List<Map<String, String>>> categories = {
    "Dresses": List.generate(
      5,
      (i) => {
        "name": "Women Dress ${i + 1}",
        "price": "${(i + 1) * 450 + 200} EGP",
        "image": "assets/images/d${i + 1}.jpg",
      },
    ),

    "Sets": List.generate(
      5,
      (i) => {
        "name": "Co-ord Set ${i + 1}",
        "price": "${(i + 1) * 600 + 300} EGP",
        "image": "assets/images/set${i + 1}.jpg",
      },
    ),

    "Tops": List.generate(
      5,
      (i) => {
        "name": "Fashion Top ${i + 1}",
        "price": "${(i + 1) * 250 + 150} EGP",
        "image": "assets/images/t_s${i + 1}.jpg",
      },
    ),

    "Trousers & Skirts": List.generate(
      10,
      (i) => {
        "name": "Skirt/Pants ${i + 1}",
        "price": "${(i + 1) * 350 + 250} EGP",
        "image": "assets/images/t${i + 1}.jpg",
      },
    ),

    "Shoes": List.generate(
      7,
      (i) => {
        "name": "Heels/Sneaker ${i + 1}",
        "price": "${(i + 1) * 800 + 500} EGP",
        "image": "assets/images/sho${i + 1}.jpg",
      },
    ),

    "Bags": List.generate(
      10,
      (i) => {
        "name": "Luxury Bag ${i + 1}",
        "price": "${(i + 1) * 900 + 400} EGP",
        "image": "assets/images/bag${i + 1}.jpg",
      },
    ),
  };

  static List<Map<String, String>> getAllItems() {
    List<Map<String, String>> all = [];

    categories.forEach((key, value) {
      all.addAll(value);
    });

    return all;
  }
}