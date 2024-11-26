import 'package:flutter/material.dart';

void main() {
  runApp(
   const Directionality(
      textDirection: TextDirection.ltr,
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu do Atendente'),
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pessoas na Mesa: 4'),
              Text('Mesa 4'),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Drinks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem('Bestseller', 'Delicious Burger', 'Classic Cheeseburger', 9.99),
                _buildMenuItem('Healthy Choice', 'Fruit Salad', 'Garden Fresh Salad', 7.99),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String category, String item1, String item2, double price) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item1),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('+')),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: const Text('X')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item2),
                Text('R\$ ${price.toStringAsFixed(2)}'),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('+')),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: const Text('X')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
