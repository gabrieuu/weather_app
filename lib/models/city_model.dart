class CityModel {
  final int cityKey;
  final String name;
  final String locality;
  final String country;
  final String countryId;
  final String state;
  final String stateId;

  CityModel({
    required this.cityKey,
    required this.name,
    required this.locality,
    required this.country,
    required this.countryId,
    required this.state,
    required this.stateId,
  });

  static CityModel fromJson(Map<String, dynamic> json) {
    return CityModel(
      cityKey: int.parse(json["Key"]), 
      name: json["LocalizedName"], 
      locality: json["Region"]["LocalizedName"], 
      country: json["Country"]["LocalizedName"], 
      countryId: json["Country"]["ID"], 
      state: json["AdministrativeArea"]["LocalizedName"], 
      stateId: json["AdministrativeArea"]["ID"],);
  }


}
