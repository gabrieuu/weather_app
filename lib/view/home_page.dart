import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/services/client_request/dio_client.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/view/view_forecast.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  
  WeatherController controller = Get.find();
  
  late double widthViewPort;

  @override
  Widget build(BuildContext context) {
    widthViewPort = MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: blue,
      body:
          Obx(() => controller.isLoading.value ? load() : _body()),
    );
  }

  load() {
    print(controller.isLoading);
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _body() {
    print(controller.isLoading);
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widthViewPort * 0.1, vertical: 30),
            child: Column(
              children: [
                BackButton(color: white, onPressed: () => Get.back(),),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text("${controller.weatherModel.city},\n${controller.weatherModel.date}")),
                SizedBox(
                    width: widthViewPort * 0.5,
                    child: Image.asset("assets/clima/29.png")),
                Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: -20,
                  children: [
                    Text(
                      "${controller.weatherModel.temperature}°",
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.weatherModel.conditionDescription,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.water_drop_sharp,
                            color: white,
                          ),
                          Text("${controller.weatherModel.humidity}%"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.air,
                            color: white,
                          ),
                          Text(controller.weatherModel.windSpeed),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: widthViewPort*0.1),
                  child: Text("Hoje"),
                ),
                cardsClimaHorizontal(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthViewPort * 0.1),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Hoje"), Text("${controller.weatherModel.forecast[0].temperatureMin}°/${controller.weatherModel.forecast[0].temperatureMax}°")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(controller.weatherModel.forecast[1].weekday), Text("${controller.weatherModel.forecast[1].temperatureMin}°/${controller.weatherModel.forecast[1].temperatureMax}°")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(controller.weatherModel.forecast[2].weekday), Text("${controller.weatherModel.forecast[2].temperatureMin}°/${controller.weatherModel.forecast[2].temperatureMax}°")],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    onPressed: (){
                      Get.to(() => ViewForecast());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: lightBlue,
                        fixedSize:Size.fromWidth(100),
                        padding: const EdgeInsets.symmetric(vertical: 20)),
                    child: const Text(
                      "Ver mais",
                      style: TextStyle(color: white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  cardsClimaHorizontal() {
    return Container(
      height: 60,
      child: ListView.separated(
        padding: EdgeInsets.only(left: widthViewPort * 0.1, right: 15),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
          width: 12,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return buildCard(index);
        },
      ),
    );
  }

  buildCard(int index) => Container(
        
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/clima/29.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(controller.weatherModel.forecast[index].weekday),
                  Text("${controller.weatherModel.forecast[index].temperatureMin}°")
                ],
              )
            ],
          ),
        )
      );
}
