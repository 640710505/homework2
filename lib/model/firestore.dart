import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}


class _StoreState extends State<Store> {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<void> createProduct(String name, String description, double price) async {
    await products.add({
      'name': name,
      'description': description,
      'price': price,
    });
  }

  Future<void> deleteProduct(String productId) async {
    await products.doc(productId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Store Items")),
      body: StreamBuilder<QuerySnapshot>(
        stream: products.snapshots(),
        builder: (context, snapshots) {
          if (!snapshots.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshots.data!.docs;

          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final product = data[index];
              String productId = product.id;
              return ListTile(
                leading: Text(productId),
                title: Text(product['name']),
                subtitle: Text(
                    "${product['description']}\nPrice: ${product['price']}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    // Show confirmation dialog before deleting
                    bool? confirm = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Delete Product"),
                          content: const Text("Are you sure you want to delete this product?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text("Delete"),
                            ),
                          ],
                        );
                      },
                    );

                    if (confirm == true) {
                      await deleteProduct(productId);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Product deleted successfully!')),
                      );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createProduct("Samsung S24 Ultra", "New phone from Samsung", 1222.99);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product added successfully!')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
