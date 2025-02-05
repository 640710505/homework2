import 'package:flutter/material.dart';

class ProductLayer extends StatefulWidget {
  const ProductLayer({super.key});

  @override
  State<ProductLayer> createState() => _ProductLayerState();
}

class _ProductLayerState extends State<ProductLayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Layout'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          
          Container(
            width: double.infinity,
            height: 50,
            color: const Color.fromARGB(255, 155, 155, 155),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Category"),
              ),
            ),
          ),
          const SizedBox(height: 20), // ไม่ให้ติดกัน

          // First row with two boxes
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // ไม่ให้ติดกัน ระหว่างกล่องในแถวเดียวกัน
              children: [
                // First box 
                Column(
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2024/04/12/11/49/ai-generated-8691762_960_720.png', // URL ของภาพ
                        fit: BoxFit.cover, // ปรับขนาดให้พอดีกับ container
                      ),
                    ),
                    const SizedBox(height: 8), // Space between box and text
                    const Text(
                      "Sneaker",
                      style: TextStyle(fontSize: 16),
                    ),
                    const Text(
                      "Price 3999",
                      style: TextStyle(fontSize: 16, color: Colors.pink),
                    ),
                  ],
                ),
                
                Column(
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2016/03/25/09/04/t-shirt-1278404_960_720.jpg', // URL ของภาพ
                        fit: BoxFit.cover, // ปรับขนาดให้พอดีกับ container
                      ),
                    ),
                    const SizedBox(height: 8), // Space between box and text
                    const Text(
                      "T-shirt",
                      style: TextStyle(fontSize: 16),
                    ),
                    const Text(
                      "Price 699",
                      style: TextStyle(fontSize: 16, color: Colors.pink),
                    ),
                  ],
                ),
              ],
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.all(20), // Padding around the row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add space between boxes
              children: [
                
                Column(
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2022/03/23/04/00/footwear-7086389_960_720.jpg', // URL ของภาพ
                        fit: BoxFit.cover, // ปรับขนาดให้พอดีกับ container
                      ),
                    ),
                    const SizedBox(height: 8), // Space between box and text
                    const Text(
                      "sock",
                      style: TextStyle(fontSize: 16),
                    ),
                    const Text(
                      "Price 299",
                      style: TextStyle(fontSize: 16, color: Colors.pink),
                    ),
                  ],
                ),
                
                Column(
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      child: Image.network(
                        'https://found.store/cdn/shop/files/baggy-jeans-blue-lacy-found-2-1.jpg?v=1714676802&width=2880', // URL ของภาพ
                        fit: BoxFit.cover, // ปรับขนาดให้พอดีกับ container
                      ),
                    ),
                    const SizedBox(height: 8), // Space between box and text
                    const Text(
                      "Baggy jeans",
                      style: TextStyle(fontSize: 16),
                    ),
                    const Text(
                      "Price 1299",
                      style: TextStyle(fontSize: 16, color: Colors.pink),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
