import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/services/interfaces/request_service.dart';

const String apiKey = "xhTwk9FoiH5CxOQPMWO5futBrL8m0qcr";

class WeatherService{
  final IRequestService client;
  WeatherService({required this.client});

  Future<CityModel> getCity({required String city}) async {
    final String url = "http://dataservice.accuweather.com/locations/v1/cities/search?apikey=${apiKey}&q=${city}&language=pt-br";
    final body = await client.get(url) as List;
    CityModel citie = CityModel.fromJson(body.first);
    return citie;
  }

  Future<List<ForecastModel>> getForecast({required int idCity}) async{
    final url = "http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/${idCity}?apikey=${apiKey}&language=pt-br";
    var body = await client.get(url) as List;
    List<ForecastModel> forecasts = body.map((list) => ForecastModel.fromJson(list)).toList();
    return forecasts;
  }

}