import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/view/view_forecast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final controller = Get.put(WeatherController(service: WeatherService(client: DioClient())));
  late double widthViewPort;
  @override
  Widget build(BuildContext context) {
    widthViewPort = MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: blue,
      body:
          _body(), //Obx(() => controller.isLoading.value ? load() : _body()),
    );
  }

  load() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widthViewPort * 0.1, vertical: 30),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: const Text("Lagos Nigeria,\n27/09/2022")),
                SizedBox(
                    width: widthViewPort * 0.5,
                    child: Image.asset("assets/clima/29.png")),
                Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: -20,
                  children: [
                    Text(
                      "27°",
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Cloudy",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.water_drop_sharp,
                            color: white,
                          ),
                          Text("70%"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.air,
                            color: white,
                          ),
                          Text("7km"),
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
                  child: Text("Today"),
                ),
                cardsClimaHorizontal(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthViewPort * 0.1),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Today"), Text("25°/27°")],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Tomorrow"), Text("25°/27°")],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Saaturday"), Text("25°/27°")],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    onPressed: (){
                      Get.to(() => ViewForecast());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: lightBlue,
                        fixedSize:
                            Size.fromWidth(MediaQuery.of(context).size.width),
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
                  Text("11:00"),
                  Text("25°")
                ],
              )
            ],
          ),
        )
      );
}
