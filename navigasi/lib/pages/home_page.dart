import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigasi/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 10000,
      image: 'images/sugar.jpg',
      stock: 10,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 17000,
      image: 'images/salt.jpg',
      stock: 25,
      rating: 4.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 0.7,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ProductCard(item: items[index]);
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Center(child: Text('Nama: Izmi Rahma Mawardah | NIM: 2407036')),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Item item;
  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/item', extra: item),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: item.name,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.asset(
                    item.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rp ${item.price}',
                    style: const TextStyle(color: Colors.teal),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stok: ${item.stock}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                          Text(
                            '${item.rating}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
