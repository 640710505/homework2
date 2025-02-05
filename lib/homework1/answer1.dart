import 'package:flutter/material.dart';

void main() {
  runApp(Gitlayer());
}

class Gitlayer extends StatelessWidget {
  const Gitlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grid Layout'),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: Column(
          children: [
            // แถวที่ 1
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                const SizedBox(width: 20), // เว้นระยะห่างแนวนอน
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.lightBlue,
                ),
                const SizedBox(width: 20), // เว้นระยะห่างแนวนอน
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blueAccent,
                ),
              ],
            ),
            const SizedBox(height: 20), // เว้นระยะห่างแนวตั้ง
            // แถวที่ 2
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blueGrey,
                ),
                const SizedBox(width: 20), // เว้นระยะห่างแนวนอน
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.lightGreenAccent,
                ),
                const SizedBox(width: 20), // เว้นระยะห่างแนวนอน
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
