import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'c2f62a0417d80c1be2c8569d6c2db71a';

  Future<String> getWeather(String location) async {
    Map<String, dynamic> parameters = {
      'q': location,
      'appId': apiKey,
    };
    Uri uri = Uri.http(authority, path, parameters);
    http.Response response = await http.get(uri);
    return response.body;
  }
}