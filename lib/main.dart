import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu do AtendenAte',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Menu do Atendente'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PessoasNaMesaWidget extends StatelessWidget {
  const PessoasNaMesaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0), // Adjust padding as needed
          child: Container(
            // Wrap with Container for background color
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5), // Set background color
              shape: BoxShape.circle, // Maintain circular shape
            ),
            child: const Padding(
              // Add padding within container for better alignment
              padding: EdgeInsets.all(4.0), // Adjust padding as needed
              child: Icon(
                Icons.person,
                color: Color.fromARGB(255, 0, 0,
                    0), // Set icon color to white for better contrast
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text('Pessoas na Mesa'),
      ],
    );
  }
}

class MesaWidget extends StatelessWidget {
  const MesaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.looks_4,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mesa 4', style: TextStyle(fontSize: 16)),
                Text('Meus Pedidos', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
                right: 10.0), // Mover o texto '4' alguns pixels para a direita
            child: Text('4', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

class Cardapio extends StatelessWidget {
  const Cardapio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Drinks',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            children: [
              _buildMenuItem('Bestseller', 'Delicious Burger',
                  'Classic Cheeseburger', 9.99),
              _buildMenuItem(
                  'Healthy Choice', 'Fruit Salad', 'Garden Fresh Salad', 7.99),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
      String category, String item1, String item2, double price) {
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
                Text('R${price.toStringAsFixed(2)}'),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Column(
        children: [
          PessoasNaMesaWidget(),
          MesaWidget(),
          Cardapio(),
        ],
      ),
    );
  }
}
