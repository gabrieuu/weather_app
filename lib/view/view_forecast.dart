import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class ViewForecast extends StatelessWidget {
  const ViewForecast({super.key});

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
                        Text("Today"),
                        Text("27°", style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),),
                        Text("Cloudy"),
                      ],
                    )
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
                        '25°/27°',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Tomorrow\n\nOct 28, 2023",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ]));
          },
          padding: EdgeInsets.only(top: 15),
          itemCount: 10,
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
