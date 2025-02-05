import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:l11/api/aqi_service.dart';

class aqi extends StatefulWidget {
  const aqi({super.key});

  @override
  State<aqi> createState() => _aqi();
}

class _aqi extends State<aqi> {
  var city = "";
  int aqis = 0;
  dynamic temp = 0.0; //different city api return different type

  Future<void> fetchData() async {
    final Fetcing = AQIService();
    final data = await Fetcing.fetchAQI();

    if (data != null) {
      setState(() {
        city = data["city"] ?? "error";
        aqis = data["aqi"] ?? 0;
        temp = data["temp"] ?? 0.0;
      });
    }
  }

  String getAqiscale(var aqis) {
    if (aqis <= 50) {
      return "Good";
    } else if (aqis <= 100) {
      return "Moderate";
    } else if (aqis <= 150) {
      return "Unhealthy for sensitive groups";
    } else if (aqis <= 200) {
      return "Unhealthy";
    } else if (aqis <= 300) {
      return "Very Unhealthy";
    } else {
      return "Hazardous";
    }
  }

  Color getcolor(var aqis) {
    if (aqis <= 50) {
      return Colors.green;
    } else if (aqis <= 100) {
      return Colors.yellow;
    } else if (aqis <= 150) {
      return Colors.orange;
    } else if (aqis <= 200) {
      return Colors.red;
    } else if (aqis <= 300) {
      return Colors.purple;
    } else {
      return Colors.black;
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
          'Air quality index (AQI,)',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1E88E5),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFE3F2FD),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              city,
              style: TextStyle(fontSize: 40, color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: getcolor(aqis),
                borderRadius: BorderRadius.circular(
                    20), //make a border is not shape any more bro
              ),
              child: Center(
                child: Text(
                  aqis.toString(),
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              getAqiscale(aqis),
              style: TextStyle(fontSize: 25, color: getcolor(aqis)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "temperature: ${temp.toString()}",
              style: TextStyle(fontSize: 25, color: Colors.blueGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: Text("Refresh",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
