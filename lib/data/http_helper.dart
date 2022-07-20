import 'package:getting_started/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'c2f62a0417d80c1be2c8569d6c2db71a';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {
      'q': location,
      'appId': apiKey,
    };
    Uri uri = Uri.http(authority, path, parameters);
    http.Response response = await http.get(uri);

    Map<String, dynamic> data = json.decode(response.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}