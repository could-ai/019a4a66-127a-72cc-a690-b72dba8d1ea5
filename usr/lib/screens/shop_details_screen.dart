import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/shop.dart';
import 'package:couldai_user_app/models/review.dart';

class ShopDetailsScreen extends StatelessWidget {
  final Shop shop;

  const ShopDetailsScreen({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    // Dummy reviews for demonstration
    final List<Review> _reviews = [
      Review(id: 'r1', userName: 'John Doe', rating: 5, comment: 'Great haircut!'),
      Review(id: 'r2', userName: 'Jane Smith', rating: 4, comment: 'Friendly staff and good service.'),
      Review(id: 'r3', userName: 'Peter Jones', rating: 5, comment: 'Best barber in town, highly recommend!'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              shop.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shop.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        shop.rating.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    shop.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Reviews',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _reviews.length,
                    itemBuilder: (context, index) {
                      final review = _reviews[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(review.userName[0]),
                          ),
                          title: Text(review.userName),
                          subtitle: Text(review.comment),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(review.rating.toString()),
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement review submission functionality
        },
        label: const Text('Write a Review'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
