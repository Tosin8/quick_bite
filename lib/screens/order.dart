// import 'package:QuickBite/components/drawer/app_drawer.dart';
// import 'package:flutter/material.dart';

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({super.key});

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold( 
//       appBar: AppBar(title: const Text("Your Orders")),
//       drawer: const AppDrawer(),
//       body: const Center(child: Text('Order is empty')), 
//     );
//   }
// }

import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  final List<Order> orders = [
    // Replace with data retrieved from your database (e.g., Firestore)
    // If no orders exist, this list will be empty.
    // Example:
    // Order(id: 1, products: [Product(id: 1, name: 'Burger', price: 5.99)]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      body: orders.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  child: ListTile(
                    title: Text('Order #${order.id}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: order.products.map((product) {
                        return Text('${product.name} - \$${product.price}');
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// Example Order model
class Order {
  final int id;
  final List<Product> products;

  Order({required this.id, required this.products});
}

// Example Product model
class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}
