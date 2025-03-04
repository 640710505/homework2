import 'package:flutter/material.dart';

class TrafficLightWidget extends StatefulWidget {
  final Color color;
  final double opacity;

  const TrafficLightWidget({
    super.key,
    required this.color,
    required this.opacity,
  });

  @override
  State<TrafficLightWidget> createState() => _TrafficLightWidgetState();
}

class _TrafficLightWidgetState extends State<TrafficLightWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: widget.opacity,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: widget.color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 6,
              blurRadius: 7,
              offset: const Offset(0, 0), // Fixed incorrect offset usage
            ),
          ],
        ),
      ),
    );
  }
}
