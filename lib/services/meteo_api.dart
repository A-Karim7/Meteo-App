import 'dart:convert';

import 'package:http/http.dart' as http;

class MeteoAPI {
  Future<Map<String, dynamic>> getMeteoAPI(String? text) async {
    var meteo = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$text&appid=c3e33bab5d94c0bb1f8792ad50f37858&units=metric");
    var response = await http.get(meteo);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    return jsonData;
  }
}
