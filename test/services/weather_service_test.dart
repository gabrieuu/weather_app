import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/services/client_request/dio_client.dart';
import 'package:weather_app/services/weather_service.dart';

void main(){
  test("deve buscar uma cidade", () async {

    var weatherService = WeatherService(client: DioClient());

    CityModel city = await weatherService.getWeather("Natal");
    expect(city.cityKey, 35658);
    expect(city.name, "Natal");
    expect(city.locality, "América do Sul");
    expect(city.country, "Brasil");
    expect(city.countryId, "BR");
    expect(city.state, "Rio Grande do Norte");
    expect(city.stateId, "RN");
    

  });
}