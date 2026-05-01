import 'package:flutter/material.dart';
import 'package:navigasi/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    style: const TextStyle(fontSize: 22, color: Colors.teal),
                  ),
                  const SizedBox(height: 10),
                  Text('Rating: ${item.rating} | Stok: ${item.stock}'),
                  const Divider(height: 30),
                  const Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Produk berkualitas tinggi untuk kebutuhan harian Anda.',
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
