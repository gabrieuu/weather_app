import 'package:weather_app/models/forecast_model.dart';

class WeatherModel {
  final int temperature;
  final String date;
  final String time;
  final String conditionDescription;
  final String currently;
  final String city;
  final int humidity;
  final double cloudiness;
  final double rain;
  final String windSpeed;
  final List<ForecastModel> forecast;

  WeatherModel(
      {required this.temperature,
      required this.date,
      required this.time,
      required this.conditionDescription,
      required this.currently,
      required this.city,
      required this.humidity,
      required this.cloudiness,
      required this.rain,
      required this.windSpeed,
      required this.forecast});

  static WeatherModel fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json["temp"],
      date: json["date"],
      time: json["time"],
      conditionDescription: json["description"],
      currently: json["currently"],
      city: json["city"],
      humidity: json["humidity"],
      cloudiness: json["cloudiness"],
      rain: json["rain"],
      windSpeed: json["wind_speedy"],
      forecast: toForecast(json["forecast"]),
    );
  }

  static List<ForecastModel> toForecast(List foreCastJson){
    List<ForecastModel> forecastList = foreCastJson.map((map) => ForecastModel.fromJson(map)).toList();
    return forecastList;
  }
}

/* 
        "temp": 23,
        "date": "24/08/2023",
        "time": "07:09",
        "condition_code": "28",
        "description": "Tempo nublado",
        "currently": "dia",
        "cid": "",
        "city": "Natal, RN",
        "img_id": "28",
        "humidity": 94,
        "cloudiness": 75.0,
        "rain": 0.0,
        "wind_speedy": "2.06 km/h",
        "wind_direction": 170,
        "sunrise": "05:24 am",
        "sunset": "05:22 pm",
        "condition_slug": "cloudly_day",
        "city_name": "Natal",
        "forecast": [
*/