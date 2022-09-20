import 'package:http/http.dart' as http;
import 'dart:convert';

//http://api.openweathermap.org/geo/1.0/direct?q=London&limit=5&appid=19eef5f2e46709488d0844ff9a0fe547
class WeatherApiClient {
  static const apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static const apiKey = '19eef5f2e46709488d0844ff9a0fe547';

  Future<int> getWeather(String city) async {
    final weatherUrl = Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric');
    final weatherResponse = await http.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw Exception('Error canot get city location');
    }
    final weatherJson = jsonDecode(weatherResponse.body);
    final temperature = weatherJson['main']['temp'];

    print('${temperature}°C');
    return 0;
  }
}
