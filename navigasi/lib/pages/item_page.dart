import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigasi/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;
  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item.name,
              child: Image.asset(
                item.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rp ${item.price}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      Text(
                        ' ${item.rating}  |  ',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Icon(
                        Icons.inventory_2_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),
                      Text(
                        ' Stok: ${item.stock}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const Divider(height: 40),
                  const Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ini adalah bahan berkualitas tinggi untuk kebutuhan dapur Anda. Diproses secara alami dan dikemas dengan higienis.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
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
