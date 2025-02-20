import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'trydocker.dart';

class AddProductDialog extends StatefulWidget {
  final Function(ProductModel) onProductAdded;
  final ProductModel? product;

  const AddProductDialog({Key? key, required this.onProductAdded, this.product})
      : super(key: key);

  @override
  _AddProductDialogState createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String description = '';
  double price = 0.0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      name = widget.product!.name;
      description = widget.product!.description;
      price = widget.product!.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.product != null ? "อัพเดทสินค้า" : "เพิ่มสินค้าใหม่"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "ชื่อสินค้า"),
              initialValue: name,
              onChanged: (value) => name = value,
              autofocus: true,
              validator: (value) =>
                  value!.isEmpty ? "กรุณากรอกชื่อสินค้า" : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "รายละเอียดสินค้า"),
              initialValue: description,
              onChanged: (value) => description = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "ราคา"),
              keyboardType: TextInputType.number,
              initialValue: price.toString(),
              onChanged: (value) => price = double.tryParse(value) ?? 0.0,
              validator: (value) => (double.tryParse(value ?? '') ?? 0) <= 0
                  ? "กรุณากรอกราคาที่ถูกต้อง"
                  : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("ยกเลิก"),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final updatedProduct = ProductModel(
                id: widget.product?.id ?? 0, // ID will be set by API
                name: name,
                description: description,
                price: price,
              );

              if (widget.product != null) {
                widget.onProductAdded(updatedProduct);
                Navigator.pop(context);
              } else {
                
                final response = await http.post(
                  Uri.parse('http://10.0.2.2:8001/products'),
                  headers: {'Content-Type': 'application/json'},
                  body: jsonEncode({
                    'name': updatedProduct.name,
                    'description': updatedProduct.description,
                    'price': updatedProduct.price,
                  }),
                );

                if (response.statusCode == 201) {
                  var productData = jsonDecode(response.body);
                  final addedProduct = ProductModel.fromJson(productData);

                  widget.onProductAdded(addedProduct);
                  Navigator.pop(context); // Close the Dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('เพิ่มสินค้าเรียบร้อย')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('ไม่สามารถเพิ่มสินค้าได้: ${response.body}'),
                    ),
                  );
                }
              }
            }
          },
          child: Text(widget.product != null ? "อัพเดทสินค้า" : "เพิ่มสินค้า"),
        ),
      ],
    );
  }
}
