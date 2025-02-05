import 'package:flutter/material.dart';

class Profilelay extends StatefulWidget {
  const Profilelay({super.key});

  @override
  State<Profilelay> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Profilelay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ส่วน Header
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.blue,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'User Name',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // ส่วนข้อมูลติดต่อ
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.email, color: Colors.blue),
                    SizedBox(width: 10),
                    Text('asd@gmail.com', style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(Icons.phone, color: Colors.blue),
                    SizedBox(width: 10),
                    Text('44534435', style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.blue),
                    SizedBox(width: 10),
                    Text('5434 Bangkok', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          // Spacer ทำให้ปุ่มอยู่ด้านล่าง
          const Spacer(),
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // กด Edit Profile
                  },
                  style: ElevatedButton.styleFrom(
                    //backgroundColor: Colors.blue,
                  ),
                  child: const Text('Edit Profile'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // กด Logout
                  },
                  style: ElevatedButton.styleFrom(
                    //backgroundColor: Colors.red,
                  ),
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
