import 'package:get/get.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherController extends GetxController{

  late WeatherModel weatherModel;
  WeatherService service;
  var isLoading = false.obs;
  WeatherController({required this.service});
  
  @override
  void onInit() async {
    isLoading.value = true;
    await fetchClima();
    isLoading.value = false;
    super.onInit();
  }
  

  Future<void> fetchClima() async{
    weatherModel = await service.getWether(city: "Natal");
  }

}