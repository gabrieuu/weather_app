import 'package:get/get.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherController extends GetxController{

  String city;
  late WeatherModel weatherModel;
  WeatherService service;
  var isLoading = false.obs;

  WeatherController({required this.service, required this.city});
  
  @override
  void onInit() async {
    isLoading.value = true;
    await fetchClima(city);
    isLoading.value = false;
    super.onInit();
  }
  

  Future<void> fetchClima(String city) async{

    weatherModel = await service.getWether(city: city);

  }

}