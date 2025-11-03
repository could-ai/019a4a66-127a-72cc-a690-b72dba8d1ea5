import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/shop.dart';
import 'package:couldai_user_app/screens/shop_details_screen.dart';
import 'package:couldai_user_app/widgets/shop_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Shop> _shops = [
    Shop(
        id: '1',
        name: 'Classic Barber Shop',
        description: 'A traditional barber shop with a modern twist.',
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.5),
    Shop(
        id: '2',
        name: 'Modern Cuts',
        description: 'The most stylish haircuts in town.',
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.8),
    Shop(
        id: '3',
        name: 'The Gentleman\'s Chair',
        description: 'Experience luxury grooming.',
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.9),
    Shop(
        id: '4',
        name: 'Quick Snips',
        description: 'Fast and friendly service.',
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.2),
  ];

  List<Shop> _filteredShops = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredShops = _shops;
    _searchController.addListener(_filterShops);
  }

  void _filterShops() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredShops = _shops.where((shop) {
        return shop.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search for shops',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredShops.length,
                itemBuilder: (context, index) {
                  final shop = _filteredShops[index];
                  return ShopCard(
                    shop: shop,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShopDetailsScreen(shop: shop),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
