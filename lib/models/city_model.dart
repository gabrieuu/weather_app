class CityModel {
  late int _cityKey;
  late String _name;
  late String _locality;
  late String _country;
  late String _countryId;
  late String _state;
  late String _stateId;

  CityModel({
    required int cityKey,
    required String name,
    required String locality,
    required String country,
    required String countryId,
    required String state,
    required String stateId,
  }){
    _cityKey = cityKey;
    _name = name;
    _locality = locality;
    _country = country;
    _countryId = countryId;
    _state = state;
    _stateId = stateId;
  }

  int get cityKey => _cityKey;
  String get name => _name;
  String get locality => _locality;
  String get country => _country;
  String get countryId => _countryId;
  String get state => _state;
  String get stateId => _stateId;

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
