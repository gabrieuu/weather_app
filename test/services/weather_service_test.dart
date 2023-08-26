import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/client_request/dio_client.dart';
import 'package:weather_app/services/interfaces/request_service.dart';
import 'package:weather_app/services/weather_service.dart';

class IRequestServiceMock extends Mock implements IRequestService{} //cria uma requisição fake

void main(){
  test("deve retornar a cidade e o clima", () async {
    final client = IRequestServiceMock();

    final weatherService = WeatherService(client: client);
    when(() => client.get(any())).thenAnswer((e) async => jsonDecode(jsonResponse));

    final WeatherModel weatherCity = await weatherService.getWether(city: "Natal");

    expect(weatherCity.city, "Natal, RN");
    expect(weatherCity.forecast.length, 10);

  });
}

const jsonResponse = r"""
{
    "by": "city_name",
    "valid_key": true,
    "results": {
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
            {
                "date": "25/08",
                "weekday": "Sex",
                "max": 29,
                "min": 23,
                "cloudiness": 1.0,
                "rain": 0.3,
                "rain_probability": 32,
                "wind_speedy": "6.18 km/h",
                "description": "Chuvas esparsas",
                "condition": "rain"
            },
            {
                "date": "26/08",
                "weekday": "Sáb",
                "max": 30,
                "min": 23,
                "cloudiness": 2.0,
                "rain": 0.0,
                "rain_probability": 0,
                "wind_speedy": "4.78 km/h",
                "description": "Tempo limpo",
                "condition": "clear_day"
            },
            {
                "date": "27/08",
                "weekday": "Dom",
                "max": 29,
                "min": 24,
                "cloudiness": 13.0,
                "rain": 0.0,
                "rain_probability": 0,
                "wind_speedy": "4.73 km/h",
                "description": "Parcialmente nublado",
                "condition": "cloudly_day"
            },
            {
                "date": "28/08",
                "weekday": "Seg",
                "max": 28,
                "min": 25,
                "cloudiness": 97.0,
                "rain": 0.32,
                "rain_probability": 20,
                "wind_speedy": "4.81 km/h",
                "description": "Chuvas esparsas",
                "condition": "rain"
            },
            {
                "date": "29/08",
                "weekday": "Ter",
                "max": 28,
                "min": 24,
                "cloudiness": 71.0,
                "rain": 0.11,
                "rain_probability": 21,
                "wind_speedy": "5.72 km/h",
                "description": "Chuvas esparsas",
                "condition": "rain"
            },
            {
                "date": "30/08",
                "weekday": "Qua",
                "max": 29,
                "min": 24,
                "cloudiness": 0.0,
                "rain": 0.22,
                "rain_probability": 27,
                "wind_speedy": "7.41 km/h",
                "description": "Chuvas esparsas",
                "condition": "rain"
            },
            {
                "date": "31/08",
                "weekday": "Qui",
                "max": 28,
                "min": 23,
                "cloudiness": 55.0,
                "rain": 0.76,
                "rain_probability": 37,
                "wind_speedy": "7.93 km/h",
                "description": "Chuvas esparsas",
                "condition": "rain"
            },
            {
                "date": "01/09",
                "weekday": "Sex",
                "max": 28,
                "min": 23,
                "cloudiness": 27.0,
                "rain": 5.12,
                "rain_probability": 75,
                "wind_speedy": "7.53 km/h",
                "description": "Chuvas esparsas",
                "condition": "rain"
            },
            {
                "date": "02/09",
                "weekday": "Sáb",
                "max": 27,
                "min": 22,
                "cloudiness": 55.0,
                "rain": 7.25,
                "rain_probability": 86,
                "wind_speedy": "7.39 km/h",
                "description": "Chuvas esparsas",
                "condition": "rain"
            }
        ],
        "cref": "0601cf"
    },
    "execution_time": 0.0,
    "from_cache": true
}
""";
