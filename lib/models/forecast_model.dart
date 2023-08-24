import 'package:weather_app/models/weather.dart';

class ForecastModel {
  final String date;
  final String weekday;
  final int temperatureMax;
  final int temperatureMin;
  final double cloudiness;
  final double rain;
  final int rain_probability;
  final String windSpeed;
  final String conditionDescription;

  ForecastModel({
    required this.date,
    required this.weekday,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.cloudiness,
    required this.rain,
    required this.rain_probability,
    required this.windSpeed,
    required this.conditionDescription,
  });

  static ForecastModel fromJson(Map json) {
    return ForecastModel(
      date: json["date"],
      weekday: json["weekday"],
      temperatureMax: json["max"],
      temperatureMin: json["min"],
      cloudiness: json["cloudiness"],
      rain: json["rain"],
      rain_probability: json["rain_probability"],
      windSpeed: json["wind_speedy"],
      conditionDescription: json["description"],
    );
  }
}

/*
 {
      "date": "24/08",
      "weekday": "Qui",
      "max": 28,
      "min": 23,
      "cloudiness": 44.0,
      "rain": 0.11,
      "rain_probability": 28,
      "wind_speedy": "6.99 km/h",
      "description": "Chuvas esparsas",
      "condition": "rain"
  },
*/