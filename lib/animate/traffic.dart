import 'package:flutter/material.dart';
import 'package:l11/animate/traf_widget.dart';

class Trafficlight extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;
  const Trafficlight(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<Trafficlight> createState() => _TrafficlightState();
}

class _TrafficlightState extends State<Trafficlight> {
  int _currentLightIndex = 0;
  void _toggleOpacity() {
    setState(() {
      _currentLightIndex = (_currentLightIndex + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Light"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleTheme,
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TrafficLightWidget(
                color: Colors.red,
                opacity: _currentLightIndex == 0 ? 1.0 : 0.3,
              ),
              SizedBox(
                height: 20,
              ),
              TrafficLightWidget(
                color: Colors.yellow,
                opacity: _currentLightIndex == 1 ? 1.0 : 0.3,
              ),
              SizedBox(
                height: 20,
              ),
              TrafficLightWidget(
                color: Colors.green,
                opacity: _currentLightIndex == 2 ? 1.0 : 0.3,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _toggleOpacity,
                child: Text(
                  "เปลี่ยนสัญญาณไฟ",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
