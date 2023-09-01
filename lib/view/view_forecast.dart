import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/utils/colors.dart';

class ViewForecast extends StatelessWidget {
  ViewForecast({super.key});

  WeatherController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: blue,
    );
  }

  _body() {
    return Column(
      children: [
        AppBar(
          backgroundColor: darkBlue,
          surfaceTintColor:darkBlue,
          iconTheme: IconThemeData(color: white),
          titleTextStyle: TextStyle(color: white),
          centerTitle: true,
          title: Text("Forecast"),
        ),
        Expanded(
          flex: 0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25),
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Image.asset("assets/clima/29.png"),
                    ),
                    Wrap(
                      spacing: -10,
                      direction: Axis.vertical,
                      children: [
                        Text("Hoje"),
                        Text("${controller.weatherModel.temperature}°", style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),),
                        Text("${controller.weatherModel.conditionDescription}"),
                      ],
                    )
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
                          const Icon(
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
        ),
        Expanded(
          flex: 2,
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                    color: lightBlue, borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Image.asset("assets/clima/29.png"),
                      ),
                      Text(
                        '${controller.weatherModel.forecast[index].temperatureMin}°/${controller.weatherModel.forecast[index].temperatureMax}°',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${controller.weatherModel.forecast[index].weekday}\n\n${controller.weatherModel.forecast[index].date}",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ]));
          },
          padding: EdgeInsets.only(top: 15),
          itemCount: controller.weatherModel.forecast.length,
        ))
      ],
    );
  }

  _appbar() {
    return AppBar(
      title: Text("teste"),
      flexibleSpace: Container(
        height: 100,
        color: darkBlue,
      ),
    );
  }
}
