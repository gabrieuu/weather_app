import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/services/interfaces/request_service.dart';

const String apiKey = "20542676";

class WeatherService{
  final IRequestService client;
  WeatherService({required this.client});

  Future<WeatherModel> getWether({required String city}) async {
    final String url = "https://api.hgbrasil.com/weather?key=${apiKey}&city_name=${city}";
    final body = await client.get(url);
    WeatherModel citie = WeatherModel.fromJson(body["results"]);
    return citie;
  }

}