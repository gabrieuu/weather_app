import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/services/interfaces/request_service.dart';

const String apiKey = "xhTwk9FoiH5CxOQPMWO5futBrL8m0qcr";

class WeatherService{
  final IRequestService client;
  WeatherService({required this.client});

  Future<CityModel> getWeather(String city) async {
    final String url = "http://dataservice.accuweather.com/locations/v1/cities/search?apikey=${apiKey}&q=${city}&language=pt-br";
    final body = await client.get(url) as List;
    CityModel citie = CityModel.fromJson(body.first);
    return citie;
  }

}