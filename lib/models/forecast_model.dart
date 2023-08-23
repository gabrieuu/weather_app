class ForecastModel {
  final DateTime date;
  final int weatherIcon;
  final String iconPhrase;
  final bool hasPrecipitacion;
  final bool isDayLight;
  final Temperature temperature;
  final int precipitationProbability;

  ForecastModel({
    required this.date,
    required this.weatherIcon,
    required this.iconPhrase,
    required this.hasPrecipitacion,
    required this.isDayLight,
    required this.temperature,
    required this.precipitationProbability,
  });

  static ForecastModel fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: DateTime.parse("2023-08-23T13:00:00-03:00"),
      weatherIcon: json["WeatherIcon"],
      iconPhrase: json["IconPhrase"],
      hasPrecipitacion: json["HasPrecipitation"],
      isDayLight: json["IsDaylight"],
      temperature: Temperature(value: json["Temperature"]["Value"], unit: json["Temperature"]["Unit"], unitType: json["Temperature"]["UnitType"]),
      precipitationProbability: json["PrecipitationProbability"],
    );
  }
}

class Temperature {
  final double value;
  final String unit;
  final int unitType;
  Temperature({required this.value, required this.unit, required this.unitType});
}
