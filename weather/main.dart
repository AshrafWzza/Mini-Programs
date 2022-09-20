import 'weather_api_client.dart';

void main(List<String> arguments) {
  if (arguments.length != 1) {
    print('pass city name');
    return; //break from main()
  }
  final city = arguments.first;
  final api = WeatherApiClient();
  api.getWeather(city);
}
