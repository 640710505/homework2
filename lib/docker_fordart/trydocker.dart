import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'addproduct.dart';

class ProductModel {
  int id;
  String name;
  String description;
  double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}

class DockerApi extends StatefulWidget {
  const DockerApi({super.key});

  @override
  State<DockerApi> createState() => _DockerApiState();
}

class _DockerApiState extends State<DockerApi> {
  List<ProductModel> products = [];
  bool isLoading = true;

  // Fetch product data from API
  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse('http://10.0.2.2:8001/products'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          products =
              jsonList.map((json) => ProductModel.fromJson(json)).toList();
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  // Delete product from API
  Future<void> deleteProduct(int productId) async {
    try {
      var response = await http.delete(
        Uri.parse('http://10.0.2.2:8001/products/$productId'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200 || response.statusCode == 204) {
        setState(() {
          products.removeWhere((product) => product.id == productId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('สินค้าถูกลบเรียบร้อยแล้ว')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ไม่สามารถลบสินค้าได้')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาดในการลบสินค้า')),
      );
    }
  }

  // Confirm deletion
  Future<void> confirmDelete(int productId) async {
    bool? confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ยืนยันการลบสินค้า'),
          content: Text('คุณต้องการลบสินค้านี้จริงหรือไม่?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('ลบ'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      deleteProduct(productId);
    }
  }

  // Update product
  Future<void> updateProduct(ProductModel product) async {
    try {
      var response = await http.put(
        Uri.parse('http://10.0.2.2:8001/products/${product.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': product.name,
          'description': product.description,
          'price': product.price,
        }),
      );

      if (response.statusCode == 200) {
        var updatedProduct = jsonDecode(response.body);
        setState(() {
          products[products.indexWhere((p) => p.id == product.id)] =
              ProductModel.fromJson(updatedProduct);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('สินค้าได้รับการอัพเดทเรียบร้อยแล้ว')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ไม่สามารถอัพเดทสินค้าได้')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาดในการอัพเดทสินค้า')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 51, 93),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : products.isEmpty
              ? const Center(child: Text("No products found"))
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(product.name),
                        subtitle: Text(product.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${product.price.toStringAsFixed(0)} Baht",
                              style: TextStyle(color: Colors.green),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                confirmDelete(product.id);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AddProductDialog(
                                      onProductAdded: (updatedProduct) {
                                        updateProduct(updatedProduct);
                                      },
                                      product: product,
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddProductDialog(
                onProductAdded: (newProduct) {
                  setState(() {
                    products.add(newProduct);
                  });
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
