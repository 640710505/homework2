import 'package:http/http.dart' as http;
import 'dart:convert';

class AQIService {
  final String token =
      "https://api.waqi.info/feed/bangkok/?token=ed1dd81dca778d8b0dce1ba6a9095bb58e41428f";

  Future<Map<String, dynamic>?> fetchAQI() async {
    try {
      final response = await http.get(Uri.parse(token));
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));

        return {
          'city': data['data']['city']['name'] ?? "N/A",
          'aqi': data['data']['aqi'] ?? 0,
          'temp': data['data']['iaqi']['t']['v'] ?? 0.0,
        };
      } else {
        print("Failed to fetch data : ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
