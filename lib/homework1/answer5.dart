import 'package:flutter/material.dart';
import 'answer1.dart';
import 'answer4.dart';
import 'answer3.dart';
import 'answer2.dart';
class Portal extends StatefulWidget {
  const Portal({super.key});

  @override
  State<Portal> createState() => _PortalState();
}

class _PortalState extends State<Portal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Answer'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 163, 213, 255), 
        child: Center( 
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Gitlayer()),
            );
                },
                child: const Text("Answer 1"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SocialLayer()),
            );
                },
                child: const Text("Answer 2"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductLayer()),
            );
                },
                child: const Text("Answer 3"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profilelay()),
            );
                },
                child: const Text("Answer 4"),
              ),
              const SizedBox(height: 10),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
