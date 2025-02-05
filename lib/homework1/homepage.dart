import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("CPSU Project",
                style: TextStyle(
                    color: Colors.white, fontSize: 28, letterSpacing: 2)),
            backgroundColor: Colors.redAccent,
            centerTitle: true),
        backgroundColor: Colors.white60,
        body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.blueAccent,
                  child: const Text("Hello World1")),
              Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.blueAccent,
                  child: const Text("Hello World2")),
              Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.blueAccent,
                  child: const Text("Hello World3")),
            ]));
  }
}
