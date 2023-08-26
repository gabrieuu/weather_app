import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/client_request/dio_client.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherController{
  late WeatherModel weather;
  final WeatherService _service = WeatherService(client: DioClient());


  fetchWeather(String city) async{
    weather = await _service.getWether(city: city);
  }
}