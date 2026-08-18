import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../cart_manager.dart';
import '../product_data.dart';
import '../widgets/app_footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  String selectedCategory = "Dresses";

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              _buildBanner(),
              _buildCategorySelector(),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      l10n.ourProducts, 
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
              
              _buildProductGrid(),
              
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      l10n.hotOffers, 
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)
                    ),
                  ],
                ),
              ),
              
              _buildHotOffers(),
              const AppFooter(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      height: 140, 
      child: PageView(
        children: [
          _item("assets/images/sales.jpg", "50% RED SALE"),
        ],
      ),
    );
  }

  Widget _item(String url, String txt) => Container(
    margin: const EdgeInsets.all(8), 
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10), 
      image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
    ), 
    child: Center(
      child: Container(
        color: Colors.red.withValues(alpha: 0.6), 
        padding: const EdgeInsets.all(5), 
        child: Text(txt, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
      )
    )
  );

  Widget _buildCategorySelector() => SingleChildScrollView(
    scrollDirection: Axis.horizontal, 
    padding: const EdgeInsets.all(16), 
    child: Row(
      children: ProductData.categories.keys.map((cat) => Padding(
        padding: const EdgeInsets.only(right: 8), 
        child: ChoiceChip(
          selectedColor: Colors.red, 
          label: Text(cat, style: TextStyle(
            color: selectedCategory == cat ? Colors.white : Theme.of(context).colorScheme.onSurface, 
            fontSize: 11
          )), 
          selected: selectedCategory == cat, 
          onSelected: (v) => setState(() => selectedCategory = cat)
        )
      )).toList()
    )
  );

  Widget _buildProductGrid() {
    var list = ProductData.categories[selectedCategory]!;
    final theme = Theme.of(context);

    return GridView.builder(
      padding: const EdgeInsets.all(16), 
      shrinkWrap: true, 
      physics: const NeverScrollableScrollPhysics(), 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10, 
        childAspectRatio: 0.75
      ), 
      itemCount: list.length, 
      itemBuilder: (context, index) {
        final item = list[index];
        return Card(
          color: theme.colorScheme.surfaceContainerHighest,
          child: Column(children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)), 
                child: Image.network(item['image']!, fit: BoxFit.cover, width: double.infinity)
              )
            ), 
            Padding(
              padding: const EdgeInsets.all(8.0), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        Text(item['name']!, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis), 
                        Text(item['price']!, style: const TextStyle(fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold))
                      ]
                    ),
                  ), 
                  GestureDetector(
                    onTap: () { 
                      CartManager.cartItems.add(item);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to cart"), duration: Duration(seconds: 1))
                      ); 
                    }, 
                    child: const Icon(Icons.add_shopping_cart, size: 18, color: Colors.red)
                  )
                ]
              )
            )
          ])
        );
      }
    );
  }

  Widget _buildHotOffers() => Column(
    children: List.generate(3, (i) => ListTile(
      leading: const Icon(Icons.local_offer, color: Colors.red), 
      title: Text("Red Deal", style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.bold)), 
      subtitle: const Text("Exclusive sale for women fashion items.")
    ))
  );
}