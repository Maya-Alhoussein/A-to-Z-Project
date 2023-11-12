import 'package:atoz/app/data/models/location/city_model.dart';

class TaxiModel {
  String? firstName;
  String? lastName;
  int? id;
  int? cityId;
  City? city;

  TaxiModel({this.firstName, this.lastName, this.id, this.cityId, this.city});

  TaxiModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    id = json['id'];
    cityId = json['CityId'];
    city = json['City'] != null ? City.fromJson(json['City']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['id'] = id;
    data['CityId'] = cityId;
    if (city != null) {
      data['City'] = city!.toJson();
    }
    return data;
  }
}
